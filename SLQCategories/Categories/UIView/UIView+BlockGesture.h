//
//  UIView+UIView_BlockGesture.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 block回调

 @param gestureRecoginzer 手势信息
 */
typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (BlockGesture)

/**
 点击手势回调

 @param block
 */
- (void)addTapActionWithBlock:(GestureActionBlock)block;

/**
 长按手势回调

 @param block
 */
- (void)addLongPressActionWithBlock:(GestureActionBlock)block;
@end
