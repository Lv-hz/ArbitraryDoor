//
//  XinLiShuDaoViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/28.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "XinLiShuDaoViewController.h"

@interface XinLiShuDaoViewController ()

@end

@implementation XinLiShuDaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景
    UIImage *image=[UIImage imageNamed:@"心理疏导"];
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
}

-(void) back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
