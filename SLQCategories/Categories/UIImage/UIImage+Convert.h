//
//  UIImage+Convert.h
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Convert)
#pragma mark - 转成黑白图像
/**
 *  转成黑白图像
 *
 *  @param sourceImage 原图
 *
 *  @return 黑白图像
 */
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;

@end
