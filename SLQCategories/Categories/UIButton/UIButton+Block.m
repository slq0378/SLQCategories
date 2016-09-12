//
//  UIButton+Block.m
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

/// 按钮绑定的key
static const void *UIButtonBlockKey = &UIButtonBlockKey;

@implementation UIButton (Block)
/// 按钮回调
- (void)addActionBlock:(TouchedButtonBlock)touchBlock {
    // button关联block
    objc_setAssociatedObject(self, UIButtonBlockKey, touchBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    // 添加事件
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  点击事件
 *
 *  @param btn 按钮
 */
- (void)actionTouched:(UIButton *)btn{
    // 获取关联对象
    TouchedButtonBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}
@end
