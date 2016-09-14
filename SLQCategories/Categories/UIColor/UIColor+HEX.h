//
//  UIColor+HEX.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)
/**
 *  由16进制颜色格式生成UIColor
 *
 *  @param hex 16进制颜色0x00FF00
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(UInt32)hex;
/**
 *  由16进制颜色格式生成UIColor
 *
 *  @param hex 16进制颜色0x00FF00
 *  @param alpha 透明
 *
 *  @return Color
 */
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
/**
 *  由16进制颜色字符串格式生成UIColor
 *
 *  @param hex 16进制颜色#00FF00
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
/**
 *  生成当前颜色的16进制字符串
 *
 *  @return 16进制字符串
 */
- (NSString *)HEXString;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;
@end
