//
//  UIImage+Alpha.m
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import "UIImage+Alpha.h"

@implementation UIImage (Alpha)
#pragma mark - 透明效果图片
/// 如果含有透明通道就返回TRUE
- (BOOL)hasAlpha {
    // 获取图片的Alpha信息
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    // 只要满足一下一种就含有透明通道
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

/// 如果不存在透明通道就添加透明通道并返回结果
- (UIImage *)imageWithAlpha {
    if ([self hasAlpha]) {
        return self; // 已有，直接返回
    }
    
    CGFloat scale = MAX(self.scale, 1.0f);
    CGImageRef imageRef = self.CGImage;
    size_t width = CGImageGetWidth(imageRef)*scale;
    size_t height = CGImageGetHeight(imageRef)*scale;
    
    // 创建位图上下文
    CGContextRef offscreenContext =
    CGBitmapContextCreate(NULL, // 渲染内存，为NULL表示由Quartz自动分配
                          width,//
                          height,
                          8,// bitsPerComponent 每个像素组件的位数
                          0,// 位图每行的字节数，0表示自动
                          CGImageGetColorSpace(imageRef),// 颜色空间
                          kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);// 位图信息，这里添加透明通道
    
    // 绘制图片
    CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef imageRefWithAlpha = CGBitmapContextCreateImage(offscreenContext);
    UIImage *imageWithAlpha = [UIImage imageWithCGImage:imageRefWithAlpha scale:self.scale orientation:UIImageOrientationUp];
    
    // Clean up
    CGContextRelease(offscreenContext);
    CGImageRelease(imageRefWithAlpha);
    
    return imageWithAlpha;
}

/// 给图片增加透明边框，将图片进行缩放
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize {
    // 如果没有透明通道，那就增加一个
    UIImage *image = [self imageWithAlpha];
    CGFloat scale = MAX(self.scale, 1.0f);
    NSUInteger scaledBorderSize = borderSize * scale;
    // 新图片大小
    CGRect newRect = CGRectMake(0, 0, image.size.width * scale + scaledBorderSize * 2, image.size.height * scale + scaledBorderSize * 2);
    
    // 创建位图
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                newRect.size.width,
                                                newRect.size.height,
                                                CGImageGetBitsPerComponent(self.CGImage),
                                                0,
                                                CGImageGetColorSpace(self.CGImage),
                                                CGImageGetBitmapInfo(self.CGImage));
    
    // 绘制位图，预留一个空白的外边框
    CGRect imageLocation = CGRectMake(scaledBorderSize, scaledBorderSize, image.size.width*scale, image.size.height*scale);
    CGContextDrawImage(bitmap, imageLocation, self.CGImage);
    CGImageRef borderImageRef = CGBitmapContextCreateImage(bitmap);
    
    // 创建图片掩码，边框透明，然后和原图合并
    CGImageRef maskImageRef = [self newBorderMask:scaledBorderSize size:newRect.size];
    CGImageRef transparentBorderImageRef = CGImageCreateWithMask(borderImageRef, maskImageRef);
    UIImage *transparentBorderImage = [UIImage imageWithCGImage:transparentBorderImageRef scale:self.scale orientation:UIImageOrientationUp];
    
    // 清理内存
    CGContextRelease(bitmap);
    CGImageRelease(borderImageRef);
    CGImageRelease(maskImageRef);
    CGImageRelease(transparentBorderImageRef);
    
    return transparentBorderImage;
}

/**
 *  创建透明边框
 *
 *  @param borderSize 边框宽度
 *  @param size       尺寸
 *
 *  @return
 */
- (CGImageRef)newBorderMask:(NSUInteger)borderSize size:(CGSize)size {
    // 颜色空间-灰度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    // 图像上下文
    CGContextRef maskContext = CGBitmapContextCreate(NULL,
                                                     size.width,
                                                     size.height,
                                                     8, // 8-bit grayscale
                                                     0,
                                                     colorSpace,
                                                     kCGBitmapByteOrderDefault | kCGImageAlphaNone);
    
    // 透明
    CGContextSetFillColorWithColor(maskContext, [UIColor blackColor].CGColor);
    CGContextFillRect(maskContext, CGRectMake(0, 0, size.width, size.height));
    
    // 中心不透明
    CGContextSetFillColorWithColor(maskContext, [UIColor whiteColor].CGColor);
    CGContextFillRect(maskContext, CGRectMake(borderSize, borderSize, size.width - borderSize * 2, size.height - borderSize * 2));
    
    // 获取图片掩码
    CGImageRef maskImageRef = CGBitmapContextCreateImage(maskContext);
    
    // 清理
    CGContextRelease(maskContext);
    CGColorSpaceRelease(colorSpace);
    
    return maskImageRef;
}
@end
