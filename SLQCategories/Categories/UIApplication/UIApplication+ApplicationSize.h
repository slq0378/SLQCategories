//
//  UIApplication+ApplicationSize.h
//  testSize
//
//  Created by Ignazio Calo on 23/01/15.
//  Copyright (c) 2015 IgnazioC. All rights reserved.
//  https://github.com/ignazioc/iOSApplicationSize
//   A small category on UIApplication used to calculate the size of the running iOS applicaiton.


#import <UIKit/UIKit.h>

@interface UIApplication (ApplicationSize)
/**
 *  统计应用文件大小
 *
 *  @return 大小
 */
- (NSString *)applicationSize;
/**
 *  计算文件夹大小
 *
 *  @param folderPath 文件夹路径
 *
 *  @return 大小
 */
- (unsigned long long)sizeOfFolder:(NSString *)folderPath;
@end
