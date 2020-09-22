//
//  ZhuCeChengGongViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/11.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "ZhuCeChengGongViewController.h"
#import "DengLuViewController.h"
@interface ZhuCeChengGongViewController ()

@end

@implementation ZhuCeChengGongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"注册成功"];
    self.view.layer.contents =(id)image.CGImage;
    
    UIButton *cg =[[UIButton alloc]init];
    cg.frame =CGRectMake(100, 550, 170, 50);
    [cg setTitle:@"返回登录面" forState:UIControlStateNormal];
    cg.backgroundColor=[UIColor darkGrayColor];
    [cg addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    cg.layer.cornerRadius =18;
    [self.view addSubview:cg];
}
-(void)back{
    DengLuViewController *dl=[[DengLuViewController alloc]init];
    [self.navigationController pushViewController:dl animated:YES];
    
}


@end
