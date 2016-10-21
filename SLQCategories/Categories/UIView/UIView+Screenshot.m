//
//  UIView+Screenshot.h
//
//  Created by Christian on 12/12/15.
//  Copyright © 2015 slq. All rights reserved.
//

#import "UIView+Screenshot.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIView (Screenshot)

- (UIImage *)screenshot {
   return [UIView captureFromView:self];
}

/**
 *  从给定UIView中截图：UIView转UIImage
 */
+ (UIImage *)captureFromView:(UIView *)view {
    
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //在新建的图形上下文中渲染view的layer
    [view.layer renderInContext:context];
    
    [[UIColor clearColor] setFill];
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}
@end
