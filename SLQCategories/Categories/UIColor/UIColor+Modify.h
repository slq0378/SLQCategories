//
//  UIColor+Modify.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Modify)
/// 翻转颜色
- (UIColor *)invertedColor;
/// 半透明色
- (UIColor *)colorForTranslucency;
/**
 *  更改颜色亮度
 *
 *  @param lighten 亮度从0到1
 *
 *  @return
 */
- (UIColor *)lightenColor:(CGFloat)lighten;
/**
 *  更改颜色亮度
 *
 *  @param darken 亮度从0到1
 *
 *  @return
 */
- (UIColor *)darkenColor:(CGFloat)darken;
@end
