//
//  UIView+Frame
//  Chating
//
//  Created by Christian on 12/12/15.
//  Copyright © 2015 slq. All rights reserved.
//

#import "UIView+Frame.h"

#import <UIKit/UIKit.h>


@implementation UIView (Frame)

- (void)setSLQWidth:(CGFloat)SLQWidth
{
    CGRect rect = self.frame;
    rect.size.width = SLQWidth;
    self.frame = rect;
}
- (CGFloat)SLQWidth
{
    return self.frame.size.width;
}

- (void)setSLQHeight:(CGFloat)SLQHeight
{
    CGRect rect = self.frame;
    rect.size.height = SLQHeight;
    self.frame = rect;
}

- (CGFloat)SLQHeight
{
    return self.frame.size.height;
}

- (void)setSLQLeft:(CGFloat)SLQLeft
{
    CGRect rect = self.frame;
    rect.origin.x = SLQLeft;
    self.frame = rect;
}

- (CGFloat)SLQLeft
{
    return self.frame.origin.x;
}

- (CGFloat)SLQTop
{
    return self.frame.origin.y;
}

- (void)setSLQTop:(CGFloat)SLQTop
{
    CGRect rect = self.frame;
    rect.origin.y = SLQTop;
    self.frame = rect;
}

- (CGFloat)SLQRight
{
    return self.SLQLeft + self.SLQWidth;
}
- (void)setSLQRight:(CGFloat)SLQRight
{
    CGRect rect = self.frame;
    rect.size.width = SLQRight;
    self.frame = rect;
}
- (CGFloat)SLQBottom
{
    return self.SLQTop + self.SLQHeight;
}

- (void)setSLQBottom:(CGFloat)SLQBottom
{
    CGRect rect = self.frame;
    rect.size.height = SLQBottom;
    self.frame = rect;
}

@end
