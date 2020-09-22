//
//  SenLinXiaoYuanViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/8.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "SenLinXiaoYuanViewController.h"
#import "YiQingViewController.h"
#import "JianKangZhanViewController.h"

@interface SenLinXiaoYuanViewController ()

@end

@implementation SenLinXiaoYuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景
    UIImage *image=[UIImage imageNamed:@"心理森林小院1"];
    self.view.layer.contents =(id)image.CGImage;
    
    //返回
    UIButton *fh =[[UIButton alloc]init];
    fh.frame =CGRectMake(30, 48, 20, 20);
    [fh setBackgroundImage:[UIImage imageNamed:@"森林返回"] forState:UIControlStateNormal];
    [fh addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:fh];
    //更多
    UIButton *gd =[[UIButton alloc]init];
    gd.frame =CGRectMake(320, 48, 20, 20);
    [gd setBackgroundImage:[UIImage imageNamed:@"森林更多"] forState:UIControlStateNormal];
    [self.view addSubview:gd];
    
    //button1（心理健康站
    UIButton *b1 =[[UIButton alloc]init];
    b1.frame =CGRectMake(75, 490, 229, 84);
    [b1 setBackgroundImage:[UIImage imageNamed:@"button1"] forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(button1) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b1];
    //button2(疫情小模块
    UIButton *b2 =[[UIButton alloc]init];
    b2.frame =CGRectMake(75, 620, 229, 84);
    [b2 setBackgroundImage:[UIImage imageNamed:@"button2"] forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(button2) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b2];
}

-(void) back{
    [self. navigationController popViewControllerAnimated:YES];
}

//心理健康站
-(void)button1{
    JianKangZhanViewController *jk=[[JianKangZhanViewController alloc]init];
    [self.navigationController pushViewController:jk animated:YES];
    
}
//疫情小模块
-(void)button2{
    YiQingViewController *yiqing=[[YiQingViewController alloc]init];
    [self.navigationController pushViewController:yiqing animated:YES];
}
@end
