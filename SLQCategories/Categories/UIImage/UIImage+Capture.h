//
//  UIImage+Capture.h
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Capture)
#pragma mark - 截图、截屏
/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)captureFromView:(UIView *)view;

/**
 *  直接截屏
 */
+(UIImage *)captureScreen;

/**
 *  从给定UIImage和指定Frame截图：
 */
-(UIImage *)captureWithFrame:(CGRect)frame;
@end
