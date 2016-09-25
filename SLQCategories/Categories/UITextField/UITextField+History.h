//
//  UITextField+History.h
//  Demo
//
//  Created by DamonDing on 15/5/26.
//  Copyright (c) 2015年 morenotepad. All rights reserved.
//
//  https://github.com/Jameson-zxm/UITextField-History
//   A category of UITextfiled that can record it's input as history

#import <UIKit/UIKit.h>

@interface UITextField (History)

/**
 *  保存历史记录的key
 */
@property (retain, nonatomic) NSString* identify;

/**
 *  加载历史记录
 *  @return 历史记录数组
 */
- (NSArray*) loadHistroy;

/**
 *  保存到NSUserDefaults
 */
- (void) synchronize;


/**
 显示历史记录
 */
- (void) showHistory;

/**
 隐藏历史记录
 */
- (void) hideHistroy;

/**
 情况历史记录
 */
- (void) clearHistory;

@end
