//
//  ViewController.m
//  UIView简介
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
/**
 控制器的view在加载完毕的时候调用此方法
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //获得label的父视图
    NSLog(@"********%@", self.label.superview);
    
    //获得控制器视图所有子控件的数组
    NSLog(@"$$$$$$$$%@", self.view.subviews);
}

#pragma mark ————— 点击按钮1 —————
- (IBAction)clickButton
{
    //如果控件不指定特定frame的话，则表示使用默认的frame，默认frame的坐标是(0,0)
    UISwitch *s = [[UISwitch alloc] init];
    [self.view addSubview:s];
    
    //后添加的控件放在先添加的控件上面
    UIStepper *stepper = [[UIStepper alloc] init];
    [self.view addSubview:stepper];
    
    //把新控件插入到具体的位置
    UISlider *slider = [[UISlider alloc] init];
    [self.view insertSubview:slider aboveSubview:stepper];
//    [self.view insertSubview:slider belowSubview:stepper];
    
    //把控件从父控件上移除
    [self.label removeFromSuperview];
    
    //在获取xib上面控件的时候，可以通过连线把控件引入到代码中，也可以通过设置tag的方式获取到这个控件
    [[self.view viewWithTag:99] removeFromSuperview];
}

#pragma mark ————— 点击按钮2 —————
- (IBAction)clickButton2
{
    //UIView不像控件那样，没有默认的frame
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:view];
    
    /**
     控件的中心点在父视图中的坐标；
     利用NSStringFromCGPoint方法，把结构体转化成字符串。
     */
    NSLog(@"%@", NSStringFromCGPoint(view.center));
    
    //打印自己视图的frame
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
