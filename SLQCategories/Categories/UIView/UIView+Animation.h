//
//  UIView+Animation.h
//  CoolUIViewAnimations
//
//  Created by Peter de Tagyos on 12/10/11.
//  Copyright (c) 2011 PT Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 度数转换弧度
 
 @param degrees 度数
 
 @return 弧度
 */
float radiansForDegrees(int degrees);

@interface UIView (Animation)
#pragma mark - Moves
//
/**
 平移
 
 @param destination 方向
 @param secs        时间
 @param option      动画方式
 */
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
/**
 平移
 
 @param destination 方向
 @param secs        时间
 @param option      动画方式
 @param delegate    代理
 @param method      动画完成回调
 */
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
/**
 平移
 
 @param destination  方向
 @param withSnapBack 是否有回弹效果
 */
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
/**
 平移
 
 @param destination  方向
 @param withSnapBack 是否有回弹效果
 @param delegate     代理
 @param method       动画完成回调
 */
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;
#pragma mark - Transforms
//
/**
 旋转
 
 @param degrees  度数
 @param secs     时间
 @param delegate 代理
 @param method   回调方法
 */    
- (void)rotate:(int)degrees secs:(float)secs delegate:(id)delegate callback:(SEL)method;
/**
 缩放
 
 @param secs     时间
 @param scaleX   x
 @param scaleY   Y
 @param delegate 代理
 @param method   回调
 */
- (void)scale:(float)secs x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;
/**
 时钟旋转样式
 
 @param secs 时间
 */
- (void)spinClockwise:(float)secs;
/**
 逆时针旋转
 
 @param secs 时间
 */
- (void)spinCounterClockwise:(float)secs;
#pragma mark - Transitions
//
/**
 翻页
 
 @param secs 时间
 */
- (void)curlDown:(float)secs;
/**
 翻页并移除view
 
 @param secs 时间
 */
- (void)curlUpAndAway:(float)secs;
/**
 旋转离开
 
 @param secs 时间
 */
- (void)drainAway:(float)secs;
#pragma mark - Effects
/**
 渐变
 
 @param newAlpha 透明度
 @param secs     时间
 */
- (void)changeAlpha:(float)newAlpha secs:(float)secs;
/**
 交替闪烁
 
 @param secs         时间
 @param continuously 持续的
 */
- (void)pulse:(float)secs continuously:(BOOL)continuously;
#pragma mark - add subview
/**
 淡出动画
 
 @param subview view
 */
- (void)addSubviewWithFadeAnimation:(UIView *)subview;

@end
