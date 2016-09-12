//
//  UIImage+Capture.m
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import "UIImage+Capture.h"

@implementation UIImage (Capture)
#pragma mark - 截图、截屏
/*
 *  直接截屏
 */
+ (UIImage *)captureScreen{
    return [self captureFromView:[UIApplication sharedApplication].keyWindow];
}

/**
 *  从给定UIView中截图：UIView转UIImage
 */
+ (UIImage *)captureFromView:(UIView *)view{
    
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //在新建的图形上下文中渲染view的layer
    [view.layer renderInContext:context];
    
    [[UIColor clearColor] setFill];
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}

/**
 *  从给定UIImage和指定Frame截图：
 */
- (UIImage *)captureWithFrame:(CGRect)frame{
    
    //创建CGImage
    CGImageRef cgimage = CGImageCreateWithImageInRect(self.CGImage, frame);
    
    //创建image
    UIImage *newImage=[UIImage imageWithCGImage:cgimage];
    
    //释放CGImage
    CGImageRelease(cgimage);
    
    return newImage;
}

@end
