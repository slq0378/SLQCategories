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

> [分类源码在这里](https://github.com/slq0378/SLQCategories)
