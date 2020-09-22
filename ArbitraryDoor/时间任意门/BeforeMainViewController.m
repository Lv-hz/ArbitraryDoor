//
//  BeforeMainViewController.m
//  ArbitraryDoors
//
//  Created by 林楚婷 on 2020/5/27.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "BeforeMainViewController.h"

@interface BeforeMainViewController ()

@end

@implementation BeforeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //返回按钮
    UIButton *back =[[UIButton alloc]initWithFrame:CGRectMake(30, 48, 20, 20)];
    [back setTintColor:[UIColor clearColor]];
    [back setBackgroundImage:[UIImage imageNamed:@"返回按钮"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:back];
    //更多按钮
    UIButton *gd =[[UIButton alloc]initWithFrame:CGRectMake(320, 48, 20, 20)];
    [gd setTintColor:[UIColor clearColor]];
    [gd setBackgroundImage:[UIImage imageNamed:@"设置按钮"] forState:UIControlStateNormal];
    [self.view addSubview:gd];
    
    //设置背景
    UIImage *backGroudImage = [UIImage imageNamed:@"5月"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //按钮“-”
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(256, 354, 38, 38)];
    [button1 setTintColor:[UIColor clearColor]];
    [button1 setBackgroundImage:[UIImage imageNamed:@"-60"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
    
    //按钮“+”
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(207, 354, 38, 38)];
    [button2 setTintColor:[UIColor clearColor]];
    [button2 setBackgroundImage:[UIImage imageNamed:@"+60"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(change2) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button2];
    
}

//返回主界面
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)change
{
    //设置背景
    UIImage *backGroudImage = [UIImage imageNamed:@"4月"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
}

- (void)change2
{
    //设置背景
    UIImage *backGroudImage = [UIImage imageNamed:@"5月"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
}

@end
