//
//  OverViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/28.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "OverViewController.h"
#import "mainViewController.h"

@interface OverViewController ()

@end

@implementation OverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景
    UIImage *image=[UIImage imageNamed:@"余音结束"];
    self.view.layer.contents =(id)image.CGImage;
    //返回
    UIButton *fh =[[UIButton alloc]init];
    fh.frame =CGRectMake(30, 48, 20, 20);
    [fh setBackgroundImage:[UIImage imageNamed:@"空间返回"] forState:UIControlStateNormal];
    //[fh addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:fh];
    //更多
    UIButton *gd =[[UIButton alloc]init];
    gd.frame =CGRectMake(320, 48, 20, 20);
    [gd setBackgroundImage:[UIImage imageNamed:@"空间更多"] forState:UIControlStateNormal];
    [self.view addSubview:gd];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    mainViewController *main =[[mainViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];
}


@end
