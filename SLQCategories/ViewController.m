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
#import "UIApplication+ApplicationSize.h"
#import "UIApplication+Permissions.h"
#import "GraphView.h"
#import "UIColorCategoriesHeader.h"
#import "UIDevice+Hardware.h"

@interface ViewController ()
/**图片*/
@property (nonatomic, strong) UIImageView *imageView;
/**按钮*/
@property (nonatomic, strong) UIButton *btn;
/**按钮*/
@property (nonatomic, strong) UIButton *infoBtn;
/**GraphView*/
@property (nonatomic, strong) GraphView *graphView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
//    [self.view addSubview:self.imageView];
//    self.imageView.image = [UIImage imageNamed:@"1"];
//    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 44)];
//    field.layer.cornerRadius = 5;
//    field.layer.masksToBounds = YES;
//    field.delegate = self;
//    field.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:field];
//    
    UIButton *infoBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth*0.5-100, ScreenHeight - 300, 200, 200)];
    [self.view addSubview:infoBtn];
    infoBtn.tag = 100;
    [infoBtn setTitle:@"信息" forState:UIControlStateNormal];
    [infoBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [infoBtn setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor] andSize:CGSizeMake(200, 200)].roundImage  forState:UIControlStateNormal];
    [infoBtn setBackgroundImage:[[UIImage imageWithColor:[UIColor orangeColor] andSize:CGSizeMake(200, 200)] covertToGrayImage].roundImage  forState:UIControlStateHighlighted];
    _infoBtn = infoBtn;
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth*0.5-50, ScreenHeight - 100, 100, 100)];
    [self.view addSubview:btn];
    btn.tag = 101;
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor greenColor] andSize:CGSizeMake(100, 100)].roundImage  forState:UIControlStateNormal];
    [btn setBackgroundImage:[[UIImage imageWithColor:[UIColor greenColor] andSize:CGSizeMake(100, 100)] covertToGrayImage].roundImage  forState:UIControlStateHighlighted];
    _btn = btn;
    [self eventHandle];
    
    
//    _graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
//    _graphView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:_graphView];
    self.view.backgroundColor = [UIColor redColor];
}

#pragma mark - 事件处理
- (void)eventHandle {
    __weak typeof (self)weakSelf = self;
    // 事件处理
    [_btn addActionBlock:^(NSInteger tag) {
        UIDevice *dev = [UIDevice currentDevice ];
        NSLog(@"设备架构:%@",[[UIDevice currentDevice] hardwareString]);// x86_64
        NSLog(@"MAC地址:%@",[UIDevice macAddress]);//A4:5E:60:BD:5F:53
        NSLog(@"设备描述:%@",[[UIDevice currentDevice ] hardwareDescription]);
//        NSLog(@"MAC地址:%@",[UIDevice macAddress]);
//        NSLog(@"MAC地址:%@",[UIDevice macAddress]);
        
        NSLog(@"CPU转速:%lu",[UIDevice cpuFrequency]);
        NSLog(@"总线频率:%lu",[UIDevice busFrequency]);
        NSLog(@"RAM尺寸:%lu",[UIDevice ramSize]);//0
        NSLog(@"CPU总数:%lu",[UIDevice cpuNumber]);//4
        
        
        
        
        
        NSLog(@"获取iOS系统的版本号:%@",[UIDevice systemVersion]);//9.3
        NSLog(@"判断当前系统是否有摄像头:%zd",[UIDevice hasCamera]);// 0
        NSLog(@"获取手机内存总量:%zd",[UIDevice totalMemoryBytes]);//
        NSLog(@"获取手机可用内存:%zd",[UIDevice freeMemoryBytes]);//
        NSLog(@"获取手机硬盘空闲空间:%lld",[UIDevice freeDiskSpaceBytes]);
        NSLog(@"获取手机硬盘总空间:%lld",[UIDevice totalDiskSpaceBytes]);
    }];
    
    [_infoBtn addActionBlock:^(NSInteger tag) {
        
        
        
    }];
}
#pragma mark - UIApplicationTest
- (void)eventHandle_ApplicationTest {
    __weak typeof (self)weakSelf = self;
    UIApplication *mainApp = [UIApplication sharedApplication];
    // 事件处理
    [_btn addActionBlock:^(NSInteger tag) {
        // 计算应用大小
        NSString *appSize = [[UIApplication sharedApplication] applicationSize];
        [weakSelf.infoBtn setTitle:appSize forState:UIControlStateNormal];
        
        if([mainApp hasAccessToCalendar] != kPermissionAccessGranted) {
            NSLog(@"不能访问日历");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"不能访问日历" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
            [alert show];
        }
    }];
    
    [_infoBtn addActionBlock:^(NSInteger tag) {
        [mainApp requestAccessToMotionWithSuccess:^{
            NSLog(@"可以访问健康信息");
        }];
        
        [mainApp requestAccessToCalendarWithSuccess:^{
            NSLog(@"可以访问日历");
        } andFailure:^{
            NSLog(@"不能访问日历");
        }];
        
        [mainApp requestAccessToRemindersWithSuccess:^{
            NSLog(@"可以访问提醒");
        } andFailure:^{
            NSLog(@"可以访问提醒");
        }];
        
        
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.imageView.image = [UIImage gaussianBlurImage:[UIImage imageNamed:@"1"]
                                       andInputRadius:5];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
