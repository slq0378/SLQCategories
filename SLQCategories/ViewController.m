//
//  ViewController.m
//  SLQCategories
//
//  Created by Christian on 16/9/9.
//  Copyright © 2016年 MrSong. All rights reserved.
//
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "AllCategoriesHeader.h"
//#import "UIApplication+ApplicationSize.h"
//#import "UIApplication+Permissions.h"
#import "GraphView.h"
#import "UIColorCategoriesHeader.h"
//#import "UIDevice+Hardware.h"
//#import "UITextField+History.h"
//#import "UITextField+Shake.h"
//#import "UITextView+PlaceHolder.h"
//#import "UIView+Animation.h"
//#import "UIView+Debug.h"
//#import "UIView+Toast.h"

@interface ViewController ()<UITextFieldDelegate>
/**图片*/
@property (nonatomic, strong) UIImageView *imageView;
/**按钮*/
@property (nonatomic, strong) UIButton *btn;
/**按钮*/
@property (nonatomic, strong) UIButton *infoBtn;
/**GraphView*/
@property (nonatomic, strong) GraphView *graphView;
/**UITextField*/
@property (nonatomic, strong) UITextField *textField;
/**UITextView*/
@property (nonatomic, strong) UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    [self.view addSubview:self.imageView];
    self.imageView.image = [UIImage imageNamed:@"1"];
    self.imageView.hidden = NO;
//    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 44)];
//    field.layer.cornerRadius = 5;
//    field.layer.masksToBounds = YES;
//    field.delegate = self;
//    field.backgroundColor = [UIColor lightGrayColor];
//    field.identify = @"ssss";
//    [self.view addSubview:field];
//    _textField = field;
    
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 44)];
//    textView.layer.cornerRadius = 5;
//    textView.layer.masksToBounds = YES;
//    textView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:textView];
//    _textView = textView;
    
    UIButton *infoBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth*0.5-100, ScreenHeight - 300, 200, 200)];
    [self.view addSubview:infoBtn];
    infoBtn.tag = 100;
    [infoBtn setTitle:@"信息" forState:UIControlStateNormal];
    [infoBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [infoBtn setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor] andSize:CGSizeMake(200, 200)].roundImage  forState:UIControlStateNormal];
//    [infoBtn setBackgroundImage:[[UIImage imageWithColor:[UIColor orangeColor] andSize:CGSizeMake(200, 200)] covertToGrayImage].roundImage  forState:UIControlStateHighlighted];
    _infoBtn = infoBtn;
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth*0.5-50, ScreenHeight - 100, 100, 100)];
    [self.view addSubview:btn];
    btn.tag = 101;
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor greenColor] andSize:CGSizeMake(100, 100)]  forState:UIControlStateNormal];
//    [btn setBackgroundImage:[[UIImage imageWithColor:[UIColor greenColor] andSize:CGSizeMake(100, 100)] covertToGrayImage].roundImage  forState:UIControlStateHighlighted];
    _btn = btn;
    [self eventHandle];
    
    
//    _graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
//    _graphView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:_graphView];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 事件处理
- (void)eventHandle {
    
    __weak typeof (self)weakSelf = self;
    // 事件处理
    [_btn addActionBlock:^(NSInteger tag) {
        NSLog(@"1%@",weakSelf.dictionaryValue);
        
        
        NSLog(@"2%@",weakSelf.allPropertyKeys);
        
        NSLog(@"3%@",weakSelf.allPropertyKeyPaths);

        //        [weakSelf.imageView raceTo:CGPointMake(10, 100) withSnapBack:YES];
        
//        NSLog(@"%@",[weakSelf.imageView autolayoutTraceDescription]);
//        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
//        temp.backgroundColor = [UIColor redColor];
//        [weakSelf.view addSubviewWithFadeAnimation:temp];
//        [temp enableDragging];
//        [weakSelf.imageView shake];
//        [weakSelf.imageView rotate:90 secs:0.5 delegate:weakSelf callback:@selector(rotate)];
//        [weakSelf.imageView scale:0.1 x:10 y:10 delegate:weakSelf callback:@selector(scale)];
//        [weakSelf.imageView raceTo:CGPointMake(100, 200) withSnapBack:YES];
        
//        [weakSelf.view makeToast:@"哈哈哈"];
//        [weakSelf.view makeToast:@"哈哈哈" duration:2.5 position:CSToastPositionCenter];
//        [weakSelf.view makeToast:@"啦啦" duration:0.5 position:CSToastPositionBottom image:[UIImage imageNamed:@"1"]];
//        [weakSelf.view makeToast:@"卡卡卡" duration:0.5 position:CSToastPositionCenter title:@"环境很好"];
//        [weakSelf.view makeToast:@"卡卡卡" duration:0.5 position:CSToastPositionCenter title:@"环境很好" image:[UIImage imageNamed:@"1"]];
//        [weakSelf.view makeToastActivity];
//        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        temp.backgroundColor = [UIColor redColor];
//        [weakSelf.view showToast:temp];
//        [weakSelf.view showToast:temp duration:0.5 position:CSToastPositionCenter];
//           [weakSelf.view showToast:temp duration:0.5 position:CSToastPositionCenter tapCallback:^{
        
//           }];
    }];
    
    [_infoBtn addActionBlock:^(NSInteger tag) {
        
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
