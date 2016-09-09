//
//  UIImage+Cateogries
//  https://github.com/slq0378/SLQCategories
//
//  Created by Christian on 16/9/9.
//  Copyright © 2016年 MrSong. All rights reserved.
//  各种好用分类方法

#import <UIKit/UIKit.h>

/*
 *  水印方向
 */
typedef enum {
    
    //左上
    ImageWaterDirectTopLeft=0,
    
    //右上
    ImageWaterDirectTopRight,
    
    //左下
    ImageWaterDirectBottomLeft,
    
    //右下
    ImageWaterDirectBottomRight,
    
    //正中
    ImageWaterDirectCenter
    
}ImageWaterDirect;


@interface UIImage (Cateogries)
#pragma mark 修正图片方向
/**
 *  修正图片方向
 *
 *  @return 返回修正后的图片
 */
- (UIImage *)fixOrientation;
/**
 *  返回指定颜色生成的图片
 *
 *  @param color 颜色
 *  @param size  尺寸
 *  @param name  文本
 *
 *  @return
 */
#pragma mark - 颜色直接生成图片
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size text:(NSString *)name;
/**
 *  获取指定尺寸（50*50）的图片
 *
 *  @param color 图片颜色
 *  @param name  文本
 *
 *  @return
 */
+ (UIImage *)imageWithColor:(UIColor *)color text:(NSString *)name;

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

#pragma mark - 模糊效果图片
+ (UIImage *)gaussianBlurImage:(UIImage *)image andInputRadius:(CGFloat)radius;
+ (UIImage *)gaussianBlurImageWithColor:(UIColor *)color andSize:(CGSize)size andInputRadius:(CGFloat)radius;
#pragma mark - 根据CIImage生成指定大小的UIImage
/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 */
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;

#pragma mark - 透明
/**
 *  是否含有透明通道
 *
 *  @return
 */
- (BOOL)hasAlpha;
/**
 *  如果没有透明通道就增加一个透明通道
 *
 *  @return
 */
- (UIImage *)imageWithAlpha;
/**
 *  给图片增加透明边框，将图片进行缩放
 *
 *  @param borderSize 边框大小
 *
 *  @return
 */
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;

- (CGImageRef)newBorderMask:(NSUInteger)borderSize size:(CGSize)size;

#pragma mark - Resize
/// UIImage自定长宽缩放
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
/// UIImage等比例缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize;
//UIImage等比例缩放
- (UIImage *)scaleImagetoScale:(CGFloat)scaleSize;

#pragma mark - 转换#FFFFFF格式颜色

/**
 *  转换#FFFFFF格式颜色
 *
 *  @param string 颜色字符串
 *
 *  @return
 */
+ (UIColor *)RGBColor:(NSString *)string;

/**
 *  转换#FFFFFF格式颜色
 *
 *  @param string 颜色只付出
 *  @param alpha  指定透明
 *
 *  @return 颜色
 */
+ (UIColor *)RGBColor:(NSString *)string alpha:(CGFloat )alpha;
#pragma mark - 圆角图片
/*
 *  圆形图片
 */
@property (nonatomic,strong,readonly) UIImage *roundImage;

#pragma mark - 截图、截屏
/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)cutFromView:(UIView *)view;

/**
 *  直接截屏
 */
+(UIImage *)cutScreen;

/**
 *  从给定UIImage和指定Frame截图：
 */
-(UIImage *)cutWithFrame:(CGRect)frame;

#pragma mark - 水印
/**
 *  文字水印
 *
 *  @param text      文字
 *  @param direction 文字方向
 *  @param fontColor 文字颜色
 *  @param fontPoint 字体
 *  @param marginXY   对齐点
 *
 *  @return
 */
-(UIImage *)waterWithText:(NSString *)text direction:(ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontPoint:(CGFloat)fontPoint marginXY:(CGPoint)marginXY;

/**
 *  绘制图片水印
 *
 *  @param waterImage 图片水印
 *  @param direction  方向
 *  @param waterSize  水印大小
 *  @param marginXY   对齐点
 *
 *  @return
 */
-(UIImage *)waterWithWaterImage:(UIImage *)waterImage direction:(ImageWaterDirect)direction waterSize:(CGSize)waterSize  marginXY:(CGPoint)marginXY;

#pragma mark - gif
/**
 *  播放gif动画
 *
 *  @param name 文件名
 *
 *  @return
 */
+ (UIImage *)animatedGIFNamed:(NSString *)name;
/**
 *  播放动画
 *
 *  @param data 源文件（图片源）
 *
 *  @return
 */
+ (UIImage *)animatedGIFWithData:(NSData *)data;
/**
 *  缩放动画
 *
 *  @param size 大小
 *
 *  @return
 */
- (UIImage *)animatedImageByScalingAndCroppingToSize:(CGSize)size;


#pragma mark - 转成黑白图像
/**
 *  转成黑白图像
 *
 *  @param sourceImage 原图
 *
 *  @return 黑白图像
 */
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;

#pragma mark - 获取指定位置的颜色
/**
 *  获取指定位置的颜色
 *
 *  @param point 文字
 *
 *  @return 颜色
 */
- (UIColor *)colorAtPoint:(CGPoint )point;

#pragma mark - 旋转图片
/**
 *  旋转图片
 *
 *  @param isHorizontal 方向
 *
 *  @return 结果图片
 */
- (UIImage *)flip:(BOOL)isHorizontal;
@end
