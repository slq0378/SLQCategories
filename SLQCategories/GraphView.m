//
//  GraphView.m
//  SLQCategories
//
//  Created by MrSong on 9/14/16.
//  Copyright © 2016 song . All rights reserved.


#import "GraphView.h"
#import "UIBezierPath+BasicShapes.h"
#import "UIBezierPath+SVG.h"
#import "UIBezierPath+Symbol.h"

@implementation GraphView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 贝瑟尔路径
    UIBezierPath *path = [UIBezierPath customBezierPathOfPencilSymbolWithRect:CGRectMake(100, 44, 100, 100) scale:1 thick:10];
    [[UIColor redColor] setStroke]; // 设置线条颜色

    path.lineJoinStyle = kCGLineJoinRound; //
    path.lineWidth = 2; // 宽度
    path.lineCapStyle = kCGLineCapRound; // 样式
    [path fill];
    // 显示
    [path stroke];
}
@end
