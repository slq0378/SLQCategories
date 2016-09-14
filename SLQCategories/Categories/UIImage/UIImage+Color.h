//
//  UIImage+Color.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)


#pragma mark - 获取指定位置的颜色
/**
 *  获取指定位置的颜色
 *
 *  @param point 文字
 *
 *  @return 颜色
 */
- (UIColor *)colorAtPoint:(CGPoint )point;


#pragma mark - 转换#FFFFFF格式颜色

/**
 *  转换#FFFFFF格式颜色
 *
 *  @param string 颜色字符串
 *
 *  @return
 */
+ (UIColor *)RGBColor:(NSString *)string;

/**
 *  转换#FFFFFF格式颜色
 *
 *  @param string 颜色只付出
 *  @param alpha  指定透明
 *
 *  @return 颜色
 */
+ (UIColor *)RGBColor:(NSString *)string alpha:(CGFloat )alpha;

#pragma mark - 颜色直接生成图片
/**
 *  返回指定颜色生成的图片
 *
 *  @param color 颜色
 *  @param size  尺寸
 *  @param name  文本
 *
 *  @return
 */
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size text:(NSString *)name;
/**
 *  获取指定尺寸（50*50）的图片
 *
 *  @param color 图片颜色
 *  @param name  文本
 *
 *  @return
 */
+ (UIImage *)imageWithColor:(UIColor *)color text:(NSString *)name;

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

@end
