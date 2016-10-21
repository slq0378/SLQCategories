//
//  UITextField+Shake.h
//  UITextField+Shake
//
//  Created by Andrea Mazzini on 08/02/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.

//  https://github.com/andreamazz/UITextField-Shake
//  UITextField category that adds shake animation

@import UIKit;

typedef NS_ENUM(NSInteger, ShakeDirection) {
    ShakeDirectionHorizontal,
    ShakeDirectionVertical
};

@interface UITextField (Shake)

/**
 震动
 */
- (void)shake;


- (void)shake:(int)times withDelta:(CGFloat)delta;

/** 震动指定次数
 *
 * @param times 次数
 * @param delta 偏移量
 * @param handler 回调
 */
- (void)shake:(int)times withDelta:(CGFloat)delta completion:(void((^)()))handler;

/** 指定时间内震动多少次
 *
 * @param times 次数
 * @param delta 偏移量
 * @param interval 震动时间
 */
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval;

/** 震动
 *
 * @param times 次数
 * @param delta 偏移量
 * @param handler 回调
 * @param interval 震动时间
 */
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void((^)()))handler;

/** 震动
 *
 * @param times 次数
 * @param delta 偏移量
 * @param interval 震动时间
 * @param direction 震动方向
 */
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection;

/** 震动
 *
 * @param times 次数
 * @param delta 偏移量
 * @param interval 震动时间
 * @param direction 震动方向
 * @param handler 回调block
 */
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection completion:(void((^)()))handler;

@end
