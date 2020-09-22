//
//  TimeDoorsViewController.m
//  ArbitraryDoors
//
//  Created by 林楚婷 on 2020/5/29.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "TimeDoorsViewController.h"
#import "BeforeMainViewController.h"
#import "FutureMainViewController.h"
#import "mainViewController.h"

@interface TimeDoorsViewController ()

@end

@implementation TimeDoorsViewController

- (void)viewDidLoad {
    
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
    //设置背景
    UIImage *backGroudImage = [UIImage imageNamed:@"时间任意门初始页面"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    //按钮1
    UIButton *beforeButton = [[UIButton alloc]initWithFrame:CGRectMake(75, 116, 228.6, 83.6)];
    [beforeButton setTintColor:[UIColor clearColor]];
    [beforeButton setBackgroundImage:[UIImage imageNamed:@"时间刻录按钮"] forState:UIControlStateNormal];
    [beforeButton addTarget:self action:@selector(goBefore) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:beforeButton];
    //按钮2
    UIButton *futureButton = [[UIButton alloc]initWithFrame:CGRectMake(75, 614, 228.6, 83.6)];
    [futureButton setBackgroundColor:[UIColor clearColor]];
    [futureButton setBackgroundImage:[UIImage imageNamed:@"时光信箱按钮"] forState:UIControlStateNormal];
    [futureButton addTarget:self action:@selector(goFuture) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:futureButton];
    //返回主界面
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-200)/2, (self.view.bounds.size.height-200)/2, 200, 200)];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:self action:@selector(goMain) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    
}

//跳转到时间刻录功能
- (void)goBefore
{
    BeforeMainViewController *before = [[BeforeMainViewController alloc]init];
    [self.navigationController pushViewController:before animated:YES];
}

//跳转到时光信箱功能
- (void)goFuture
{
    FutureMainViewController *future = [[FutureMainViewController alloc]init];
    [self.navigationController pushViewController:future animated:YES];
}

//回到主界面
-(void)goMain
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
