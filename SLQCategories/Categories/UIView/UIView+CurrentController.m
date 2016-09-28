//
//  UIView+CurrentController.m
//
//
//  Created by Christian on 16/7/6.
//  Copyright © 2016年 SLQ. All rights reserved.
//

#import "UIView+CurrentController.h"

@implementation UIView (CurrentController)

/** 获取当前View的控制器对象 */
-(UIViewController *)getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}
@end
