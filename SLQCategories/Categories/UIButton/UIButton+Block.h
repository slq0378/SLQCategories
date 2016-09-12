//
//  UIButton+Block.h
//  SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//  按钮block点击事件

#import <UIKit/UIKit.h>
/**
 *  点击按钮block
 *
 *  @param tag tag
 */
typedef void (^TouchedButtonBlock)(NSInteger tag);
@interface UIButton (Block)

/**
 *  便捷target，可省去addTarget，直接使用block进行回调点击事件
 *
 *  @param touchBlock TouchedButtonBlock
 */
-(void)addActionBlock:(TouchedButtonBlock)touchBlock;
@end
