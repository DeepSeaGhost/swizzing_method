//
//  ViewController.m
//  mthodSwizzing
//
//  Created by reset on 2018/5/9.
//  Copyright © 2018年 HangzhouVongi. All rights reserved.
//

#import "ViewController.h"
#import "Change.h"
#import "Replace.h"
#import "AddMethod.h"
#import "Super.h"
#import "Sub.h"
#import "Complete.h"
#import "PVC1.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *push;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.push = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 160)];
    self.push.backgroundColor = [UIColor redColor];
    [self.push addTarget:self action:@selector(pushClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.push];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.view.backgroundColor = [UIColor orangeColor];
    //三种MZ初始
//    [Change run];
//    [Replace sleep];
//    [AddMethod work];
    
    
    //一些错误的体验
//    [Super run];
//    [Sub run];
//
//    [Super eat];
//    [Sub eat];
//
//    [Super sleep];
//    [Sub sleep];
    
    
    //相对完整的实现
//    [Complete run];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.view.backgroundColor = [UIColor whiteColor];
    //初始
//    [Change eat];
    
    
    //相对完整的实现
//    [Complete eat];
}



//当前控制器的判断
- (void)pushClick {
    UINavigationController *pNav1 = [[UINavigationController alloc]initWithRootViewController:[PVC1 new]];
    [self presentViewController:pNav1 animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
