//
//  ZhuCeViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/11.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "ZhuCeViewController.h"
#import "ZhuCeChengGongViewController.h"
@interface ZhuCeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *chenggong;
@property (weak, nonatomic) IBOutlet UIButton *fasong;
@end

@implementation ZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"注册页"];
    self.view.layer.contents =(id)image.CGImage;
    
    self.chenggong.layer.cornerRadius =25;
    self.fasong.layer.cornerRadius =20;
    [self.chenggong addTarget:self action:@selector(clickcg) forControlEvents:UIControlEventTouchDown];
    
    //返回
    UIButton *fh =[[UIButton alloc]init];
    fh.frame =CGRectMake(30, 48, 55, 20);
    fh.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [fh setBackgroundImage:[UIImage imageNamed:@"返回键"] forState:UIControlStateNormal];
    [fh addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:fh];
}
-(void)clickcg{
    ZhuCeChengGongViewController *zc =[[ZhuCeChengGongViewController alloc]init];
    [self.navigationController pushViewController:zc animated:YES];
    
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
