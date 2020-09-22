//
//  MailBoxViewController.m
//  ArbitraryDoors
//
//  Created by 林楚婷 on 2020/5/27.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "MailBoxViewController.h"
#import "MailViewController.h"

@interface MailBoxViewController ()

@property(nonatomic) UIVisualEffectView *effectview;
@property(nonatomic) UIImageView *ani;

@end

@implementation MailBoxViewController

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
    UIImage *backGroudImage = [UIImage imageNamed:@"我的信箱"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //信封1
    UIButton *Letter1 = [[UIButton alloc]initWithFrame:CGRectMake(60, 400, 270, 85)];
    [Letter1 setTintColor:[UIColor clearColor]];
    [Letter1 setBackgroundImage:[UIImage imageNamed:@"信封1"] forState:UIControlStateNormal];
    [Letter1 addTarget:self action:@selector(open) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:Letter1];
    
    //信封2
    UIButton *Letter2 = [[UIButton alloc]initWithFrame:CGRectMake(60, 500, 270, 85)];
    [Letter2 setTintColor:[UIColor clearColor]];
    [Letter2 setBackgroundImage:[UIImage imageNamed:@"信封2"] forState:UIControlStateNormal];
    [self.view addSubview:Letter2];
    
    //信封3
    UIButton *Letter3 = [[UIButton alloc]initWithFrame:CGRectMake(60, 600, 270, 85)];
    [Letter3 setTintColor:[UIColor clearColor]];
    [Letter3 setBackgroundImage:[UIImage imageNamed:@"信封3"] forState:UIControlStateNormal];
    [self.view addSubview:Letter3];
    
    //信封4
    UIButton *Letter4 = [[UIButton alloc]initWithFrame:CGRectMake(60, 700, 270, 36)];
    [Letter4 setTintColor:[UIColor clearColor]];
    [Letter4 setBackgroundImage:[UIImage imageNamed:@"信封4"] forState:UIControlStateNormal];
    [self.view addSubview:Letter4];
}

//返回上级界面
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)open
{
    //加入模糊效果
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    self.effectview.frame =self.view.frame;
    self.effectview.alpha = 0.35;
    [self.view addSubview:self.effectview];
    
    //动画设置
    _ani = [[UIImageView alloc]init];
    _ani = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-350)/2, 280, 350, 350)];
    _ani.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    _ani.image = [UIImage imageNamed:@"信1"];
    [self.view addSubview:_ani];
    NSMutableArray *imagearray = [[NSMutableArray alloc]init];
    for(int i=1;i<=24;i++)
    {
        UIImage * image =[UIImage imageNamed:[NSString stringWithFormat:@"信%d",i]];
        [imagearray addObject:image];
    }
    _ani.animationImages =imagearray;
    _ani.animationDuration = 2.1;
    _ani.animationRepeatCount = 1;
    //开始动画
    [_ani startAnimating];
    //停止
    _ani.image = [UIImage imageNamed:@"信24"];
    //点击事件
    _ani.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ClickImage)];
    [_ani addGestureRecognizer:singleTap];
    
}

- (void)ClickImage
{
    MailViewController *mail = [[MailViewController alloc]init];
    [self.navigationController pushViewController:mail animated:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
    //移除信封
    [self.effectview removeFromSuperview];
    [self.ani removeFromSuperview];
}

@end
