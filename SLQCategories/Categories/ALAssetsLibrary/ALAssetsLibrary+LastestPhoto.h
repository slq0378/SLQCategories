//
//  ALAssetsLibrary+LatestPhoto.h
//  
//
//  Created by song on 2017/5/24.
//  Copyright © 2017年 xx. All rights reserved.
//

#include <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface ALAssetsLibrary(LastestPhoto)
/**
 *  获取最新一张图片，适用于8.0以下iOS系统版本
 *
 *  @param block 回调
 */
- (void)latestAsset:(void(^_Nullable)(UIImage * _Nullable asset,NSError *_Nullable error)) block;

/**
 获取 相册最新一张照片 ，适用于8.0一声iOS系统版本

 @param block 回调
 */
- (void)latestPhoto:(void (^_Nullable)(UIImage * _Nullable))block;
@end
