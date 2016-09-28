# SLQCategories
iOS Categories,that is all.
# UIImage 分类
@(iOS)[UIImage]

[TOC]

## 修正图片方向
- 这个使用很常见，特别是在上传图片时，一定要记得修正方向，不然安卓或者服务端下载下来方向就不对了。
- 当然这个分类方法是已经有大神写出来了。
- `image = [image fixOrientation];`

> [具体解析，参考这篇文字](http://www.cocoachina.com/ios/20150605/12021.html)

## 指定颜色生成图片
- 由颜色`UIColor`直接生成对应的图片，当然要指定尺寸。
- `image = [UIImage imageWithColor:[UIColor colorWithRed:30 green:190 blue:100 alpha:0.1] andSize:CGSizeMake(100, 100)];`


## 图片模糊
- 生成带有模糊效果的图片，可以直接又UIImage生成，或者直接生成纯色的模糊图片。还有边框
- 图片模糊

- ![Snip20160905_1.png](http://upload-images.jianshu.io/upload_images/760578-f00b605c5e9829b4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)   
- ![Snip20160905_2.png](http://upload-images.jianshu.io/upload_images/760578-e42e1550111da138.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 纯色图片模糊
- ![Snip20160905_4.png](http://upload-images.jianshu.io/upload_images/760578-9a65bfa895848f4d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- ![Snip20160905_5.png](http://upload-images.jianshu.io/upload_images/760578-f2a2ede89263262b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 转换`#FFFFFF`格式颜色
- 直接生成`UIColor`类型的颜色，可以指定透明通道


## 透明边框效果图片
- 给图片添加透明通道，实现透明边框效果
- ![Snip20160905_6.png](http://upload-images.jianshu.io/upload_images/760578-4a57d6b56bd76f10.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- ![Snip20160905_7.png](http://upload-images.jianshu.io/upload_images/760578-e5d7d271bb489b25.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## UIImage缩放
- UIImage等比例缩放、UIImage自定长宽缩放

```objc
    UIImage *image = [UIImage imageNamed:@"1"];
    NSLog(@"%@",NSStringFromCGSize(image.size));// {1920, 1080}
    image = [UIImage reSizeImage:image toSize:CGSizeMake(100, 100)];
    // image = [UIImage scaleImage:image toScale:0.5];//{960, 540}
    NSLog(@"%@",NSStringFromCGSize(image.size));//{100, 100}
```


## 圆形图片
- 圆形图片经常用的，直接写一个分类，方便


## 截屏\截图
- 屏幕截图
- 从指定的view截图

## 水印
- 图片水印，将图片绘制到一张图片任意位置
- 文字水印，将文字绘制到一张图片任意位置

- ![Snip20160907_10.png](http://upload-images.jianshu.io/upload_images/760578-4dcdb5a4d4476f50.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- ![Snip20160907_11.png](http://upload-images.jianshu.io/upload_images/760578-0a74b4cbca93e63b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
//  图片水印
image = [image waterWithWaterImage:[UIImage imageNamed:@"2"] direction:ImageWaterDirectCenter waterSize:CGSizeMake(100, 100) marginXY:CGPointMake(0, 0)];
// 文字水印
image =  [image waterWithText:@"哈哈哈" direction:ImageWaterDirectCenter fontColor:[UIColor blackColor] fontPoint:60 marginXY:CGPointMake(0, 0)];
```


## GIF动画
- 播放gif格式的动画
-  ![动画演示.gif](http://upload-images.jianshu.io/upload_images/760578-545b0a01c7acae79.gif?imageMogr2/auto-orient/strip)

## 由CIImage生成UIImage
- 用到`CIImage`时可能需要转换，直接生成指定尺寸的`UIInage`


## 转成黑白图像
- 直接将彩色图片转换为黑白的


## 获取图片指定位置的颜色
- 有时候可能需要获取指定位置某个像素的颜色


##  旋转图片
- 水平旋转或者垂直旋转图片


## 好了，接下来会继续整理相关分类，当然大家如果有好的分类，也可以添加到这个工程中。众人拾材火焰高。

# UIButton分类

## 改变UIButtonl的字体
- 给UIButton添加分类，重写load方法，运用运行时对方法进行交换
- load方法会在第一次引用这个类时调用


## UIButton的便捷block
- 便捷target，可省去addTarget，直接使用block进行回调点击事件
- 实现方式通过运行时的关联对象功能，给每个UIButton关联一个block来实现回调
- 但是也有不好的地方，无法指定按钮事件的类型，自己看情况使用吧
- 源代码

## 显示倒计时
- 显示倒计时，倒计时过程中不能点击
- ![按钮倒计时.gif](http://upload-images.jianshu.io/upload_images/760578-cb7d10a126208742.gif?imageMogr2/auto-orient/strip)


- 使用简单 `[btn startTime:10 title:@"计算" waitTittle:@"计算中..."];`


## 在按钮上显示一个菊花对象
- 使用运行时关联技术，将菊花对象关联到按钮,同样旋转状态下不能点击
- ![按钮倒计时.gif](http://upload-images.jianshu.io/upload_images/760578-c8b9d26bf9c6fb63.gif?imageMogr2/auto-orient/strip)


# UIAlertView Block实现回调
- 封装一个便捷的block回调来实现UIAlertView的事件。

# UIColor分类

## 生成渐变色
- 指定两种颜色和渐变色的高度范围即可。
> ![渐变色.gif](http://upload-images.jianshu.io/upload_images/760578-d0f2391c9e4f8b53.gif?imageMogr2/auto-orient/strip)


```objc
/**
 *  生成渐变色
 *
 *  @param c1     头
 *  @param c2     尾
 *  @param height 范围
 *
 *  @return 渐变色
 */
+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;
```


## 16进制颜色
- 16进制数字转换颜色
- 16进制字符串转换颜色

```objc
/**
 *  由16进制颜色格式生成UIColor
 *
 *  @param hex 16进制颜色0x00FF00
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(UInt32)hex;
/**
 *  由16进制颜色格式生成UIColor
 *
 *  @param hex 16进制颜色0x00FF00
 *  @param alpha 透明
 *
 *  @return Color
 */
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
/**
 *  由16进制颜色字符串格式生成UIColor
 *
 *  @param hex 16进制颜色#00FF00
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
/**
 *  生成当前颜色的16进制字符串
 *
 *  @return 16进制字符串
 */
- (NSString *)HEXString;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;
@end
```

## 颜色亮度、饱和度等


```objc
/// 翻转颜色
- (UIColor *)invertedColor;
/// 半透明色
- (UIColor *)colorForTranslucency;
/**
 *  更改颜色亮度
 *
 *  @param lighten 亮度从0到1
 *
 *  @return
 */
- (UIColor *)lightenColor:(CGFloat)lighten;
/**
 *  更改颜色亮度
 *
 *  @param darken 亮度从0到1
 *
 *  @return
 */
- (UIColor *)darkenColor:(CGFloat)darken;
@end
```


## 随机生成颜色

```objc
#import <UIKit/UIKit.h>

@interface UIColor (Random)
/// 随机生成颜色
+ (UIColor *)RandomColor;
@end
```

# UIApplication分类

## 应用文件大小
- 可以计算包含Cache、library、document三个目录下文件的大小

```objc
/**
 *  统计应用文件大小
 *
 *  @return 大小
 */
- (NSString *)applicationSize;


/**
 *  计算文件夹大小
 *
 *  @param folderPath 文件夹路径
 *
 *  @return 大小
 */
- (unsigned long long)sizeOfFolder:(NSString *)folderPath;
```

## 应用权限
- 包含通讯录、相册、蓝牙、位置、麦克风、提醒、运动数据等权限的获取方式。

```objc

//Check permission of service. Cannot check microphone or motion without asking user for permission
-(kPermissionAccess)hasAccessToBluetoothLE;
-(kPermissionAccess)hasAccessToCalendar;
-(kPermissionAccess)hasAccessToContacts;
-(kPermissionAccess)hasAccessToLocation;
-(kPermissionAccess)hasAccessToPhotos;
-(kPermissionAccess)hasAccessToReminders;

//Request permission with callback
/**
*  请求访问日历
*
*  @param accessGranted 允许
*  @param accessDenied  拒绝
*/
-(void)requestAccessToCalendarWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  请求访问通讯录
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToContactsWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  请求访问麦克风
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToMicrophoneWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  请求访问相册
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToPhotosWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  请求访问提醒事项
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToRemindersWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;

/**
 *  请求访问位置信息
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToLocationWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;

/**
 *  检查运动状态
 *
 *  @param accessGranted 允许
 */
-(void)requestAccessToMotionWithSuccess:(void(^)())accessGranted;

//Needs investigating - unsure whether it can be implemented because of required delegate callbacks
//-(void)requestAccessToBluetoothLEWithSuccess:(void(^)())accessGranted;

@end
```

# UIBezierPath分类

- [绘图参考这个文章](http://www.cnblogs.com/songliquan/p/4592117.html)

## 绘制特殊图形

- heartShape 
> ![Snip20160914_8.png](http://upload-images.jianshu.io/upload_images/760578-e61535c60505e72c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- userShape
> ![Snip20160914_7.png](http://upload-images.jianshu.io/upload_images/760578-629fd4fea1490e0e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- martiniShape
> ![Snip20160914_9.png](http://upload-images.jianshu.io/upload_images/760578-958caaa27630907d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- starShape
> ![Snip20160914_12.png](http://upload-images.jianshu.io/upload_images/760578-40a7eaba7dc954e9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


- 这种方式绘制起来太复杂，要自己计算各种角度。其实有一个更加方便的工具。在Mac上有个软件叫[PaintCode](http://www.paintcodeapp.com/)专门绘制适用于OC和Swift的二维图形。

```objc
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
```


## 打印贝瑟尔路径信息

```objc
/// 打印贝瑟尔路径信息
- (NSString*)toSVGString;
```

## 绘制特殊符号

>![Snip20160914_15.png](http://upload-images.jianshu.io/upload_images/760578-23cada8d16649d5d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>![Snip20160914_16.png](http://upload-images.jianshu.io/upload_images/760578-104feaf7685c6a12.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>![Snip20160914_17.png](http://upload-images.jianshu.io/upload_images/760578-e73bd9babd6a2be6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>![Snip20160914_18.png](http://upload-images.jianshu.io/upload_images/760578-d5b3e670b0c27797.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```objc
/// 十
+ (UIBezierPath *)customBezierPathOfPlusSymbolWithRect:(CGRect)rect   // plus
                                                scale:(CGFloat)scale;
/// -
+ (UIBezierPath *)customBezierPathOfMinusSymbolWithRect:(CGRect)rect  // minus
                                                  scale:(CGFloat)scale;
/**
 *  ✅号
 *
 *  @param rect  位置
 *  @param scale 缩放
 *  @param thick 厚度
 *
 *  @return
 */
+ (UIBezierPath *)customBezierPathOfCheckSymbolWithRect:(CGRect)rect  // check
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick;
/**
 *  ❌号
 *
 *  @param rect  位置
 *  @param scale 缩放
 *  @param thick 厚度
 *
 *  @return
 */
+ (UIBezierPath *)customBezierPathOfCrossSymbolWithRect:(CGRect)rect  // cross
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick;
/**
 *  箭头
 *
 *  @param rect  位置
 *  @param scale 缩放
 *  @param thick 厚度
 *  @param direction 方向
 *
 *  @return
 */
+ (UIBezierPath *)customBezierPathOfArrowSymbolWithRect:(CGRect)rect  // arrow
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick
                                              direction:(UIBezierPathArrowDirection)direction;
/**
 *  ✏️图形
 *
 *  @param rect  位置
 *  @param scale 缩放
 *  @param thick 厚度
 *
 *  @return
 */
+ (UIBezierPath *)customBezierPathOfPencilSymbolWithRect:(CGRect)rect // pencil
                                                   scale:(CGFloat)scale
                                                   thick:(CGFloat)thick;

@end
```

> 绘图的源代码比较枯燥，就不贴了，去github看吧

# UIControl+Block
- 使用Block方式处理UIControl控件的点击事件


```objc
#import <UIKit/UIKit.h>

@interface UIControl (Block)

- (void)touchDown:(void (^)(void))eventBlock;
- (void)touchDownRepeat:(void (^)(void))eventBlock;
- (void)touchDragInside:(void (^)(void))eventBlock;
- (void)touchDragOutside:(void (^)(void))eventBlock;
- (void)touchDragEnter:(void (^)(void))eventBlock;
- (void)touchDragExit:(void (^)(void))eventBlock;
- (void)touchUpInside:(void (^)(void))eventBlock;
- (void)touchUpOutside:(void (^)(void))eventBlock;
- (void)touchCancel:(void (^)(void))eventBlock;
- (void)valueChanged:(void (^)(void))eventBlock;
- (void)editingDidBegin:(void (^)(void))eventBlock;
- (void)editingChanged:(void (^)(void))eventBlock;
- (void)editingDidEnd:(void (^)(void))eventBlock;
- (void)editingDidEndOnExit:(void (^)(void))eventBlock;

@end
```
# UIDevice+Hardware
- 一些设备相关的方法

```objc
//Return the current device CPU frequency
+ (NSUInteger)cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)busFrequency;
//current device RAM size
+ (NSUInteger)ramSize;
//Return the current device CPU number
+ (NSUInteger)cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)totalDiskSpaceBytes;
@end
```

# UIView 分类


## UIView+Animation
- UIView的动画，平移，缩放啊，旋转啊，淡入淡出啊等等。

```objectivec
 #import <UIKit/UIKit.h>

/**
 度数转换弧度
 
 @param degrees 度数
 
 @return 弧度
 */
float radiansForDegrees(int degrees);

@interface UIView (Animation)
#pragma mark - Moves
//
/**
 平移
 
 @param destination 方向
 @param secs        时间
 @param option      动画方式
 */
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
/**
 平移
 
 @param destination 方向
 @param secs        时间
 @param option      动画方式
 @param delegate    代理
 @param method      动画完成回调
 */
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
/**
 平移
 
 @param destination  方向
 @param withSnapBack 是否有回弹效果
 */
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
/**
 平移
 
 @param destination  方向
 @param withSnapBack 是否有回弹效果
 @param delegate     代理
 @param method       动画完成回调
 */
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;
#pragma mark - Transforms
//
/**
 旋转
 
 @param degrees  度数
 @param secs     时间
 @param delegate 代理
 @param method   回调方法
 */    
- (void)rotate:(int)degrees secs:(float)secs delegate:(id)delegate callback:(SEL)method;
/**
 缩放
 
 @param secs     时间
 @param scaleX   x
 @param scaleY   Y
 @param delegate 代理
 @param method   回调
 */
- (void)scale:(float)secs x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;
/**
 时钟旋转样式
 
 @param secs 时间
 */
- (void)spinClockwise:(float)secs;
/**
 逆时针旋转
 
 @param secs 时间
 */
- (void)spinCounterClockwise:(float)secs;
#pragma mark - Transitions
//
/**
 翻页
 
 @param secs 时间
 */
- (void)curlDown:(float)secs;
/**
 翻页并移除view
 
 @param secs 时间
 */
- (void)curlUpAndAway:(float)secs;
/**
 旋转离开
 
 @param secs 时间
 */
- (void)drainAway:(float)secs;
#pragma mark - Effects
/**
 渐变
 
 @param newAlpha 透明度
 @param secs     时间
 */
- (void)changeAlpha:(float)newAlpha secs:(float)secs;
/**
 交替闪烁
 
 @param secs         时间
 @param continuously 持续的
 */
- (void)pulse:(float)secs continuously:(BOOL)continuously;
#pragma mark - add subview
/**
 淡出动画
 
 @param subview view
 */
- (void)addSubviewWithFadeAnimation:(UIView *)subview;

@end
```


## UIView+BlockGesture
- 手势回调block ，快捷添加手势

```objectivec
#import <UIKit/UIKit.h>

/**
 block回调

 @param gestureRecoginzer 手势信息
 */
typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (BlockGesture)

/**
 点击手势回调

 @param block
 */
- (void)addTapActionWithBlock:(GestureActionBlock)block;

/**
 长按手势回调

 @param block
 */
- (void)addLongPressActionWithBlock:(GestureActionBlock)block;
@end

```

- 看了之前的分类，这个太熟悉了，直接使用关联来管理新功能


## UIView+Debug
- 调试模式下显示出所有UIView的边界,使用方法交换，对所有init方法进行替换，然后绘制边界,重写load方法
- ![Alt text](./屏幕快照 2016-09-27 下午5.39.26.png)


## UIView+draggable
- 主要实现控件可拖动，开启后可在视图内自由拖动控件.
- 这个英文注释也很好看懂，就不翻译了。

```objectivec
/**-----------------------------------------------------------------------------
 * @name UIView+draggable Methods
 * -----------------------------------------------------------------------------
 */

/** Enables the dragging
 *
 * Enables the dragging state of the view
 */
- (void)enableDragging;

/** Disable or enable the view dragging
 *
 * @param draggable The boolean that enables or disables the draggable state
 */
- (void)setDraggable:(BOOL)draggable;
```

## UIView+Nib
- 快捷加载xib文件，从本地路径读取xib并获取需要的view


```objectivec
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

```

## UIView+RecursiveDescription
- 打印视图的层级关系,这个方法在调试时很有用，查看view的层级关系。

```
•UIWindow:0x7f9ad0f080f0
|   •UIView:0x7f9ad0d06970
|   |   *_UILayoutGuide:0x7f9ad0d06d20
|   |   *_UILayoutGuide:0x7f9ad0d07770
|   |   UIImageView:0x7f9ad0c075c0
|   |   UIButton:0x7f9ad0d0c3d0'信息'
|   |   |   UIButtonLabel:0x7f9ad0d0da50'信息'
|   |   UIButton:0x7f9ad0d0f2d0'点击'
|   |   |   UIImageView:0x7f9ad0d112b0
|   |   |   UIButtonLabel:0x7f9ad0d0f7a0'点击'

Legend:
	* - is laid out with auto layout
	+ - is laid out manually, but is represented in the layout engine because translatesAutoresizingMaskIntoConstraints = YES
	• - layout engine host
```

```objectivec
#import <UIKit/UIKit.h>

@interface UIView (RecursiveDescription)
//打印视图层级
-(NSString*)recursiveView;
//打印约束
-(NSString*)constraintsDescription;
//打印整个视图树的字符串
-(NSString*)autolayoutTraceDescription;

@end
```

## UIView+Screenshot
- 获取屏幕截图，可以直接指定view进行截图

```objectivec
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
```

## UIView+Shake
- 这个也是地震抖动效果，和之前的UITextField+Shake一样

```objectivec
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, UIViewShakeDirection) {
    UIViewShakeDirectionHorizontal = 0,
    UIViewShakeDirectionVertical
};

@interface UIView (Shake)
/**
 震动
 */
- (void)shake;


- (void)shake:(int)times withDelta:(CGFloat)delta;

/** 震动指定次数
 *
 * @param times 次数
 * @param delta 偏移量
 * @param handler 回调
 */
- (void)shake:(int)times withDelta:(CGFloat)delta completion:(void((^)()))handler;

/** 指定时间内震动多少次
 *
 * @param times 次数
 * @param delta 偏移量
 * @param interval 震动时间
 */
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval;

/** 震动
 *
 * @param times 次数
 * @param delta 偏移量
 * @param handler 回调
 * @param interval 震动时间
 */
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void((^)()))handler;

/** 震动
 *
 * @param times 次数
 * @param delta 偏移量
 * @param interval 震动时间
 * @param direction 震动方向
 */
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(UIViewShakeDirection)shakeDirection;

/** 震动
 *
 * @param times 次数
 * @param delta 偏移量
 * @param interval 震动时间
 * @param direction 震动方向
 * @param handler 回调block
 */
- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(UIViewShakeDirection)shakeDirection completion:(void((^)()))handler;


@end
```

## UIView+Toast
- 这个是安卓类似的toast提示效果，还不错
-![Alt text](./屏幕快照 2016-09-28 上午10.41.29.png)

```objectivec
#import <UIKit/UIKit.h>

extern NSString * const CSToastPositionTop;
extern NSString * const CSToastPositionCenter;
extern NSString * const CSToastPositionBottom;

@interface UIView (Toast)
#pragma mark - toast提示
// each makeToast method creates a view and displays it as toast
- (void)makeToast:(NSString *)message;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position image:(UIImage *)image;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title;
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title image:(UIImage *)image;
#pragma mark - 显示菊花转动
// displays toast with an activity spinner
- (void)makeToastActivity;
- (void)makeToastActivity:(id)position;
- (void)hideToastActivity;
#pragma mark - 将View当做一个toast弹出
// the showToast methods display any view as toast
- (void)showToast:(UIView *)toast;
- (void)showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point;
- (void)showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point
      tapCallback:(void(^)(void))tapCallback;

@end
```

## UIView+CurrentController
- 获取当前view的控制器对象，这个很常用

```objectivec
#import <UIKit/UIKit.h>

@interface UIView (CurrentController)

/** 获取当前View的控制器对象 */
-(UIViewController *)getCurrentViewController;
@end
```

> [分类源码在这里](https://github.com/slq0378/SLQCategories)
