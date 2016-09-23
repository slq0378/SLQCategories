# SLQCategories
iOS Categories,that is all.
# UIImage 分类大集合
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
@(iOS)[UIButton,UIAlertView]

[TOC]

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
> 总结一下，以后使用起来就方便了

> [分类源码在这里](https://github.com/slq0378/SLQCategories)
