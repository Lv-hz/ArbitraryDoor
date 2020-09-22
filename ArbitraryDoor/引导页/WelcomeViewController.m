//
//  WelcomeViewController.m
//  ArbitraryDoors
//
//  Created by 林楚婷 on 2020/5/27.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "WelcomeViewController.h"
#import "DengLuViewController.h"

@interface WelcomeViewController ()

@property (nonatomic) int num;
@property (nonatomic) UIButton *button1;
@property (nonatomic) UIButton *button2;

@end

@implementation WelcomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.num = 1;
    
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
    //设置背景
    UIImage *backGroudImage = [UIImage imageNamed:@"引导页-1"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    //next
    _button1 = [[UIButton alloc]initWithFrame:CGRectMake(250, 750, 80, 30)];
    _button1.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [_button1 setTintColor:[UIColor clearColor]];
    [_button1 setBackgroundImage:[UIImage imageNamed:@"引导页next"] forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_button1];
    
}

//下一页
-(void)next
{
    self.num++;
    //翻页动画
    [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionTransitionCurlUp animations:NULL completion:NULL];
    //设置背景
    UIImage *backGroudImage = [UIImage imageNamed:[NSString stringWithFormat:@"引导页-%d",self.num]];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    if (self.num == 4) {
        //移除next
        [self.button1 removeFromSuperview];
        //到登录界面
        _button2 = [[UIButton alloc]initWithFrame:CGRectMake(240, 750, 90, 35)];
        _button2.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
        [_button2 setTintColor:[UIColor clearColor]];
        [_button2 setBackgroundImage:[UIImage imageNamed:@"开启旅途"] forState:UIControlStateNormal];
        [_button2 addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:_button2];
    }
}

//进入登录界面
-(void)enter
{
    DengLuViewController *dl = [[DengLuViewController alloc]init];
    [self.navigationController pushViewController:dl animated:YES];
}


@end

