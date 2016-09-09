//
//  ViewController.m
//  SLQCategories
//
//  Created by Christian on 16/9/9.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Cateogries.h"

@interface ViewController ()
/**图片*/
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    [self.view addSubview:self.imageView];
    self.imageView.image = [UIImage imageNamed:@"1"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.imageView.image = [UIImage gaussianBlurImage:[UIImage imageNamed:@"1"] andInputRadius:5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
