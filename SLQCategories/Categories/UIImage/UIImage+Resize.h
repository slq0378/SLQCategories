//
//  UIImage+Resize.h
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)
#pragma mark - Resize
/// UIImage自定长宽缩放
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
/// UIImage等比例缩放
+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize;
//UIImage等比例缩放
- (UIImage *)scaleImagetoScale:(CGFloat)scaleSize;

@end
