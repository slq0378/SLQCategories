//
//  UIBezierPath+BasicShapes.h
//  Example
//
//  Created by Pierre Dulac on 26/02/13.
//  Copyright (c) 2013 Pierre Dulac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (BasicShapes)
/// 心型
+ (UIBezierPath *)heartShape:(CGRect)originalFrame;
/// 用户形状
+ (UIBezierPath *)userShape:(CGRect)originalFrame;
/// 马汀尼
+ (UIBezierPath *)martiniShape:(CGRect)originalFrame;

+ (UIBezierPath *)beakerShape:(CGRect)originalFrame;
/// 五角星
+ (UIBezierPath *)starShape:(CGRect)originalFrame;
/// 多个五角星
+ (UIBezierPath *)stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame;

@end
