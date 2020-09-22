//
//  YuYinViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/28.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "YuYinViewController.h"
#import "OverViewController.h"
#import "KongJianViewController.h"
#import "mainViewController.h"
#import "YuYinEditViewController.h"
#import "YunYinContent.h"

@interface YuYinViewController ()

@end

@implementation YuYinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景
    UIImage *image=[UIImage imageNamed:@"余音背景"];
    self.view.layer.contents =(id)image.CGImage;
    //返回
    UIButton *fh =[[UIButton alloc]init];
    fh.frame =CGRectMake(30, 48, 20, 20);
    [fh setBackgroundImage:[UIImage imageNamed:@"空间返回"] forState:UIControlStateNormal];
    [fh addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:fh];
    //更多
    UIButton *gd =[[UIButton alloc]init];
    gd.frame =CGRectMake(320, 48, 20, 20);
    [gd setBackgroundImage:[UIImage imageNamed:@"空间更多"] forState:UIControlStateNormal];
    [self.view addSubview:gd];
    
    //显示文字
    UIButton *b1 =[[UIButton alloc]init];
    b1.frame =CGRectMake(90, 385, 200, 230);
    b1.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [b1 setBackgroundImage:[UIImage imageNamed:@"显示文字"] forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b1];
    
    //确认发送
    UIButton *b2 =[[UIButton alloc]init];
    b2.frame =CGRectMake(50, 660, 100, 50);
    b2.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [b2 setBackgroundImage:[UIImage imageNamed:@"确认发送-1"] forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b2];
    //直接离开
    UIButton *b3 =[[UIButton alloc]init];
    b3.frame =CGRectMake(210, 660, 100, 50);
    b3.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [b3 setBackgroundImage:[UIImage imageNamed:@"直接离开-1"] forState:UIControlStateNormal];
    [b3 addTarget:self action:@selector(likai) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b3];
}
-(void)back{
    [YunYinContent shareYuYinContent].lastcontent =@"";
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)likai{
    [YunYinContent shareYuYinContent].lastcontent =@"";
    mainViewController *main =[[mainViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];
}

//在这个函数里从[YunYinContent shareYuYinContent].lastcontent可得到要发送的nsstring，之后置空
-(void)send{

    [YunYinContent shareYuYinContent].lastcontent =@"";
    OverViewController *over =[[OverViewController alloc]init];
    [self.navigationController pushViewController:over animated:YES];
    
}
-(void)edit{
    YuYinEditViewController *edit =[[YuYinEditViewController alloc]init];
    [self.navigationController pushViewController:edit animated:YES];
  
}
@end
