//
//  UIView+Screenshot.h
//
//  Created by Christian on 12/12/15.
//  Copyright © 2015 slq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

/**
 截图

 @return UIImage
 */
- (UIImage *)screenshot;

/**
 从指定view截图

 @param view 指定view

 @return UIImage
 */
+ (UIImage *)captureFromView:(UIView *)view;
@end
