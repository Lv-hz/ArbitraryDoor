//
//  YiQingViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/8.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "YiQingViewController.h"
#import "XinLiShuDaoViewController.h"
#import "JinRiYiQingViewController.h"

@interface YiQingViewController ()

@end

@implementation YiQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景
    UIImage *image=[UIImage imageNamed:@"心理森林小院2"];
    self.view.layer.contents =(id)image.CGImage;
    
    //返回
    UIButton *fh =[[UIButton alloc]init];
    fh.frame =CGRectMake(30, 40, 20, 20);
    [fh setBackgroundImage:[UIImage imageNamed:@"森林返回"] forState:UIControlStateNormal];
    [fh addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:fh];
    
    //更多
    UIButton *gd =[[UIButton alloc]init];
    gd.frame =CGRectMake(320, 40, 20, 20);
    [gd setBackgroundImage:[UIImage imageNamed:@"森林更多"] forState:UIControlStateNormal];
    [self.view addSubview:gd];
    
    
    //button1
    UIButton *b1 =[[UIButton alloc]init];
    b1.frame =CGRectMake(63, 245, 250, 120);
    [b1 setBackgroundImage:[UIImage imageNamed:@"place1"] forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(button1) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b1];
    //button2
    UIButton *b2 =[[UIButton alloc]init];
    b2.frame =CGRectMake(63, 395, 250, 120);
    [b2 setBackgroundImage:[UIImage imageNamed:@"place2"] forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(button2) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b2];
    //button3
    UIButton *b3 =[[UIButton alloc]init];
    b3.frame =CGRectMake(63, 545, 250, 120);
    [b3 setBackgroundImage:[UIImage imageNamed:@"place3"] forState:UIControlStateNormal];
    [b3 addTarget:self action:@selector(button3) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b3];
}

//action
-(void) back{
    [self.navigationController popViewControllerAnimated:YES];
}
//今日疫情
-(void)button1{
    
    JinRiYiQingViewController *jr =[[JinRiYiQingViewController alloc]init];
    [self.navigationController pushViewController:jr animated:YES];
}
//心理疏导
-(void)button2{
    XinLiShuDaoViewController *xl=[[XinLiShuDaoViewController alloc]init];
    [self.navigationController pushViewController:xl animated:YES];
}

//隔离生活贴士
-(void)button3{
    
}
@end
