//
//  UIImage+Alpha.h
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Alpha)
#pragma mark - 透明
/**
 *  是否含有透明通道
 *
 *  @return
 */
- (BOOL)hasAlpha;
/**
 *  如果没有透明通道就增加一个透明通道
 *
 *  @return
 */
- (UIImage *)imageWithAlpha;
/**
 *  给图片增加透明边框，将图片进行缩放
 *
 *  @param borderSize 边框大小
 *
 *  @return
 */
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;

- (CGImageRef)newBorderMask:(NSUInteger)borderSize size:(CGSize)size;
@end
