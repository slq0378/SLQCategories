//
//  UIImage+fixOrientation.h
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (fixOrientation)
#pragma mark 修正图片方向
/**
 *  修正图片方向
 *
 *  @return 返回修正后的图片
 */
- (UIImage *)fixOrientation;
@end
