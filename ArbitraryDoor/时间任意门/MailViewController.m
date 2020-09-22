//
//  MailViewController.m
//  ArbitraryDoors
//
//  Created by 林楚婷 on 2020/5/27.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "MailViewController.h"

@interface MailViewController ()

@property(nonatomic) UIButton *button;  //点击查看纸条
@property(nonatomic) UIButton *A;
@property(nonatomic) UIButton *B;
@property(nonatomic) UIButton *C;
@property(nonatomic) UIButton *next;

@end

@implementation MailViewController

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
    UIImage *backGroudImage = [UIImage imageNamed:@"查看信件"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //时光纸条按钮
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(47, 670, 280, 85)];
    [self.button setTintColor:[UIColor clearColor]];
    [self.button setBackgroundImage:[UIImage imageNamed:@"时光纸条的按钮"] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(paper1) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.button];
}

//返回上级界面
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)paper1
{
    //显示纸条1
    UIImage *backGroudImage = [UIImage imageNamed:@"纸条1"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //移除Button
    [self.button removeFromSuperview];
    
    //显示选项A
    self.A = [[UIButton alloc]initWithFrame:CGRectMake(50, 700, 70, 30)];
    [self.A setTintColor:[UIColor clearColor]];
    [self.A setBackgroundImage:[UIImage imageNamed:@"A"] forState:UIControlStateNormal];
    [self.A addTarget:self action:@selector(question1) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.A];
    //显示选项B
    self.B = [[UIButton alloc]initWithFrame:CGRectMake(150, 700, 70, 30)];
    [self.B setTintColor:[UIColor clearColor]];
    [self.B setBackgroundImage:[UIImage imageNamed:@"B"] forState:UIControlStateNormal];
    [self.view addSubview:self.B];
    //显示选项C
    self.C = [[UIButton alloc]initWithFrame:CGRectMake(250, 700, 70, 30)];
    [self.C setTintColor:[UIColor clearColor]];
    [self.C setBackgroundImage:[UIImage imageNamed:@"C"] forState:UIControlStateNormal];
    [self.view addSubview:self.C];
}

- (void)question1
{
    //显示A选项回答
    UIImage *backGroudImage = [UIImage imageNamed:@"回答1"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //移除按钮
    [self.A removeFromSuperview];
    [self.B removeFromSuperview];
    [self.C removeFromSuperview];
    
    //设置next
    self.next = [[UIButton alloc]initWithFrame:CGRectMake(150, 690, 70, 30)];
    [self.next setTintColor:[UIColor clearColor]];
    [self.next setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [self.next addTarget:self action:@selector(paper2) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.next];
}

- (void)paper2
{
    //显示纸条2
    UIImage *backGroudImage = [UIImage imageNamed:@"纸条2"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //移除Button
    [self.next removeFromSuperview];
    
    //显示选项A
    self.A = [[UIButton alloc]initWithFrame:CGRectMake(50, 700, 70, 30)];
    [self.A setTintColor:[UIColor clearColor]];
    [self.A setBackgroundImage:[UIImage imageNamed:@"A"] forState:UIControlStateNormal];
    [self.view addSubview:self.A];
    //显示选项B
    self.B = [[UIButton alloc]initWithFrame:CGRectMake(150, 700, 70, 30)];
    [self.B setTintColor:[UIColor clearColor]];
    [self.B setBackgroundImage:[UIImage imageNamed:@"B"] forState:UIControlStateNormal];
    [self.view addSubview:self.B];
    //显示选项C
    self.C = [[UIButton alloc]initWithFrame:CGRectMake(250, 700, 70, 30)];
    [self.C setTintColor:[UIColor clearColor]];
    [self.C setBackgroundImage:[UIImage imageNamed:@"C"] forState:UIControlStateNormal];
    [self.C addTarget:self action:@selector(question2) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.C];
}

- (void)question2
{
    //显示A选项回答
    UIImage *backGroudImage = [UIImage imageNamed:@"回答2"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //移除按钮
    [self.A removeFromSuperview];
    [self.B removeFromSuperview];
    [self.C removeFromSuperview];
    
    //设置next
    self.next = [[UIButton alloc]initWithFrame:CGRectMake(150, 690, 70, 30)];
    [self.next setTintColor:[UIColor clearColor]];
    [self.next setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [self.next addTarget:self action:@selector(end) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.next];
}

- (void)end
{
    //结束界面
    UIImage *backGroudImage = [UIImage imageNamed:@"end"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //设置bye按钮
    UIButton *bye = [[UIButton alloc]initWithFrame:CGRectMake(150, 690, 70, 30)];
    [bye setTintColor:[UIColor clearColor]];
    [bye setBackgroundImage:[UIImage imageNamed:@"bye"] forState:UIControlStateNormal];
    [bye addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:bye];
    
}


@end
