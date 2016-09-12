//
//  UIButton+CountDown.h
//  https://github.com/slq0378/SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//  倒计时

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)
/**
 *  显示倒计时，倒计时过程中不能点击
 *
 *  @param timeout    时长
 *  @param tittle     标题
 *  @param waitTittle 倒计时显示的标题
 */
- (void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;
@end
