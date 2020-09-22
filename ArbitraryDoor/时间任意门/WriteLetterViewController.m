//
//  WriteLetterViewController.m
//  ArbitraryDoors
//
//  Created by 林楚婷 on 2020/5/28.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "WriteLetterViewController.h"

@interface WriteLetterViewController ()

@property(nonatomic) UILabel *y1;
@property(nonatomic) UILabel *m1;
@property(nonatomic) UILabel *d1;
@property(nonatomic) UILabel *y2;
@property(nonatomic) UILabel *m2;
@property(nonatomic) UILabel *d2;

@property(nonatomic) UIVisualEffectView *effectview;
@property(nonatomic) UIImageView *imageView;
@property(nonatomic) UIButton *confirm;
@property(nonatomic) UIButton *cancle;

@property(nonatomic,strong) UIDatePicker *datePiacker;   //时间选择器

@end

@implementation WriteLetterViewController

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
    UIImage *backGroudImage = [UIImage imageNamed:@"写一封信"];
    self.view.layer.contents = (id)backGroudImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //获取系统当前年月日,确定今天时间
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay;
    NSDateComponents *d = [cal components:unitFlags fromDate:date];
    NSInteger year = [d year];
    //年
    NSString *y1String = [NSString stringWithFormat:@"%ld",(long)year];
    self.y1 = [[UILabel alloc]initWithFrame:CGRectMake(142, 458, 45, 15)];
       self.y1.text = y1String;
    self.y1.textAlignment = NSTextAlignmentCenter;
    self.y1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.y1];
    //月
    NSInteger month = [d month];
    NSString *m1String = [NSString stringWithFormat:@"%ld",(long)month];
    self.m1 = [[UILabel alloc]initWithFrame:CGRectMake(205, 458, 30, 15)];
    self.m1.text = m1String;
    self.m1.textAlignment = NSTextAlignmentCenter;
    self.m1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.m1];
    //日
    NSInteger day = [d day];
    NSString *d1String = [NSString stringWithFormat:@"%ld",(long)day];
    self.d1 = [[UILabel alloc]initWithFrame:CGRectMake(245, 458, 30, 15)];
    self.d1.text = d1String;
    self.d1.textAlignment = NSTextAlignmentCenter;
    self.d1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.d1];
   
    //发送按钮
    UIButton *send = [[UIButton alloc]initWithFrame:CGRectMake(190, 743, 90, 32)];
    [send setTintColor:[UIColor clearColor]];
    [send setBackgroundImage:[UIImage imageNamed:@"发送"] forState:UIControlStateNormal];
    [send addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:send];
    
    //时间选择器
    self.datePiacker = [[UIDatePicker alloc]initWithFrame:CGRectMake(30, 680, 300, 45)];
    self.datePiacker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    self.datePiacker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.datePiacker];
    
}

//返回上级界面
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)send
{
    //加入模糊效果
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterial];
    self.effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    self.effectview.frame =self.view.frame;
    self.effectview.alpha = 0.6;
    [self.view addSubview:self.effectview];
    
    //加入提示框
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-340)/2, (self.view.bounds.size.height-220)/2, 340, 220)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    self.imageView.backgroundColor = [UIColor clearColor];
    UIImage *image = [UIImage imageNamed:@"提示框"];
    self.imageView.image = image;
    [self.view addSubview:self.imageView];
    
    //提示框按钮--确认发送
    self.confirm = [[UIButton alloc]initWithFrame:CGRectMake(68, 450, 120, 35)];
    [self.confirm setTintColor:[UIColor clearColor]];
    [self.confirm setBackgroundImage:[UIImage imageNamed:@"确认发送2"] forState:UIControlStateNormal];
    [self.confirm addTarget:self action:@selector(confirmSend) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.confirm];
    
    //提示框按钮--返回
    self.cancle = [[UIButton alloc]initWithFrame:CGRectMake(200, 450, 120, 35)];
    [self.cancle setTintColor:[UIColor clearColor]];
    [self.cancle setBackgroundImage:[UIImage imageNamed:@"再改一下"] forState:UIControlStateNormal];
    [self.cancle addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.cancle];
    
    NSDate *theDate = self.datePiacker.date;
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay;
    NSDateComponents *d = [cal components:unitFlags fromDate:theDate];
    //年
    NSInteger year = [d year];
    NSString *y2String = [NSString stringWithFormat:@"%ld",(long)year];
    self.y2 = [[UILabel alloc]initWithFrame:CGRectMake(152, 384, 45, 15)];
       self.y2.text = y2String;
    self.y2.textAlignment = NSTextAlignmentCenter;
    self.y2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.y2];
    //月
    NSInteger month = [d month];
    NSString *m2String = [NSString stringWithFormat:@"%ld",(long)month];
    self.m2 = [[UILabel alloc]initWithFrame:CGRectMake(222, 384, 30, 15)];
    self.m2.text = m2String;
    self.m2.textAlignment = NSTextAlignmentCenter;
    self.m2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.m2];
    //日
    NSInteger day = [d day];
    NSString *d2String = [NSString stringWithFormat:@"%ld",(long)day];
    self.d2 = [[UILabel alloc]initWithFrame:CGRectMake(268, 384, 30, 15)];
    self.d2.text = d2String;
    self.d2.textAlignment = NSTextAlignmentCenter;
    self.d2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.d2];
}

//再改一下 返回写信界面
- (void)change
{
    //移除提示框
    [self.effectview removeFromSuperview];
    [self.cancle removeFromSuperview];
    [self.confirm removeFromSuperview];
    [self.imageView removeFromSuperview];
    [self.y2 removeFromSuperview];
    [self.m2 removeFromSuperview];
    [self.d2 removeFromSuperview];
}

- (void)confirmSend
{
    //发送成功提示框
    UIImageView *imageViewSend = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-340)/2, (self.view.bounds.size.height-220)/2, 340, 220)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    UIImage *imageSend = [UIImage imageNamed:@"发送成功"];
    imageViewSend.backgroundColor = [UIColor clearColor];
    imageViewSend.image = imageSend;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [self.view addSubview:imageViewSend];
    
    //返回按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-120)/2, 450, 120, 40)];
    [button setTintColor:[UIColor clearColor]];
    [button setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

@end
