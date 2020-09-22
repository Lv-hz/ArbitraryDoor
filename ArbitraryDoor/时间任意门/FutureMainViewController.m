//
//  FutureViewController.m
//  ArbitraryDoors
//
//  Created by 林楚婷 on 2020/5/27.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "FutureMainViewController.h"
#import "MailBoxViewController.h"
#import "WriteLetterViewController.h"

@interface FutureMainViewController ()

@end

@implementation FutureMainViewController

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
    UIImage *backGroudImage = [UIImage imageNamed:@"时光信箱"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //按钮1
    UIButton *writeButton = [[UIButton alloc]initWithFrame:CGRectMake(75, 490, 229, 84)];
    [writeButton setTintColor:[UIColor clearColor]];
    [writeButton setBackgroundImage:[UIImage imageNamed:@"写"] forState:UIControlStateNormal];
    [writeButton addTarget:self action:@selector(writeLetter) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:writeButton];
    //按钮2
    UIButton *readButton = [[UIButton alloc]initWithFrame:CGRectMake(75, 620, 229, 84)];
    [readButton setBackgroundColor:[UIColor clearColor]];
    [readButton setBackgroundImage:[UIImage imageNamed:@"读"] forState:UIControlStateNormal];
    [readButton addTarget:self action:@selector(mailBox) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:readButton];
}

//返回主界面
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

//进入我的信箱
- (void)mailBox
{
    MailBoxViewController *mail = [[MailBoxViewController alloc]init];
    [self.navigationController pushViewController:mail animated:YES];
}

//进入写信界面
- (void)writeLetter
{
    WriteLetterViewController *write = [[WriteLetterViewController alloc]init];
    [self.navigationController pushViewController:write animated:YES];
}

@end
