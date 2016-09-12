//
//  UIButton+Font.m
//  https://github.com/slq0378/SLQCategories
//
//  Created by Christian on 16/9/12.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import "UIButton+Font.h"
#import <objc/runtime.h>
@implementation UIButton (Font)
#pragma mark - 改变字体
/// 黑魔法，方法交换
+ (void)load {
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
    Method imp2 = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method myImp2 = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
    method_exchangeImplementations(imp2, myImp2);
}

/// xib 加载
- (id)myInitWithCoder:(NSCoder *)aDecode{
    
    [self myInitWithCoder:aDecode];
    if (self) {
        [self setupFont];
    }
    return self;
}
/// frame 方式加载
- (id)myInitWithFrame:(CGRect )frame{
    
    [self myInitWithFrame:frame];
    if (self) {
        [self setupFont];
    }
    return self;
}
/// 改变字体
- (void)setupFont {
    // 部分不想改变字体的 把tag值设置成666跳过
    if (self.tag != 666) {
        self.titleLabel.font = [UIFont systemFontOfSize:23];
        //            CGFloat fontSize = self.font.pointSize;
        //            self.font = [UIFont systemFontOfSize:fontSize * SizeScale];
    }
}
@end
