//
//  UIImage+Rotate.h
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rotate)
#pragma mark - 旋转图片
/**
 *  旋转图片
 *
 *  @param isHorizontal 方向
 *
 *  @return 结果图片
 */
- (UIImage *)flip:(BOOL)isHorizontal;
@end
