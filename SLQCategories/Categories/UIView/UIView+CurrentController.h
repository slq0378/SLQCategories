//
//  UIView+CurrentController.h
//  
//
//  Created by Christian on 16/7/6.
//  Copyright © 2016年 SLQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CurrentController)

/** 获取当前View的控制器对象 */
-(UIViewController *)getCurrentViewController;
@end
