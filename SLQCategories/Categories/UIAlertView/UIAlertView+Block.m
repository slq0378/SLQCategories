//
//  UIAlertView+Block.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by 符现超 on 15/5/9.
//  Copyright (c) 2015年 All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

static NSString *UIAlertViewKey = @"UIAlertViewKey";

@interface UIAlertView ()<UIAlertViewDelegate>
/// UIAlertView 的关联Block
@property (nonatomic, copy) UIAlertViewCallBackBlock alertViewCallBackBlock;
@end

@implementation UIAlertView (Block)
/**
 *  便捷UIAlertView Block
 *
 *  @param alertViewCallBackBlock 回调
 *  @param title                  标题
 *  @param message                信息
 *  @param cancelButtonName       取消按钮
 *  @param otherButtonTitles      其他按钮.....
 */
+ (void)alertWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonName otherButtonTitles: otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        // 遍历其他按钮
        va_start(args, otherButtonTitles); // 开始
        while ((other = va_arg(args, NSString*))) {
            [alert addButtonWithTitle:other];
        }
        va_end(args);// 一定要记得结束遍历
    }
    alert.delegate = alert;
    [alert show];
    alert.alertViewCallBackBlock = alertViewCallBackBlock;
}

/// 关联Block
- (void)setAlertViewCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock {
    
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &UIAlertViewKey, alertViewCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];
}

/// 获取关联的block
- (UIAlertViewCallBackBlock)alertViewCallBackBlock {
    
    return objc_getAssociatedObject(self, &UIAlertViewKey);
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.alertViewCallBackBlock) {
        self.alertViewCallBackBlock(buttonIndex);
    }
}


@end
