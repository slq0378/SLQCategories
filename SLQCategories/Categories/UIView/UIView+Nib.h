//
//  UIView+Nib.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Nib)
#pragma mark - 就在xib
/**
 直接加载和类同名的xib

 @return XIB
 */
+ (UINib *)loadNib;

/**
 加载xib

 @param nibName xib名称

 @return xib
 */
+ (UINib *)loadNibNamed:(NSString*)nibName;

/**
 加载xib

 @param nibName xib名称
 @param bundle  路径名称

 @return xib
 */
+ (UINib *)loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle;
#pragma mark - 加载xib，获取对应view
+ (instancetype)loadInstanceFromNib;
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner;

/**
 加载xib，从xib中获取当前类对应的view

 @param nibName xib名称
 @param owner   拥有者
 @param bundle  路径名

 @return 找到需要的view
 */
+ (instancetype)loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
