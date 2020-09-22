//
//  mainViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/5.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "mainViewController.h"
#import "DengLuViewController.h"
#import "AppDelegate.h"
#import "gerenViewController.h"
#import "Mycolor.h"
#import "SenLinXiaoYuanViewController.h"
#import "KongJianViewController.h"
#import "BeiJiXiongViewController.h"
#import "Myposition.h"
#import "TimeDoorsViewController.h"


@interface mainViewController ()
{
    Mycolor *mycolor;
    UIButton *mid;
    Myposition *myp;
    UIView *Senlin;
    UIView *Shijian;
    UIView *Kongjian;
    UIView *Beijixiong;
}


@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    mycolor=[Mycolor newcolor];
    myp=[Myposition new];
    
    self.view.backgroundColor=[UIColor colorWithRed:[mycolor.redcolor floatValue] green:[mycolor.greecolor floatValue] blue:[mycolor.bluecolor floatValue] alpha:1];
    
    //阴影1
    UIImageView *y1=[[UIImageView alloc]init];
    y1.image =[UIImage imageNamed:@"阴影1"];
    y1.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    y1.frame =CGRectMake(280, 60, 50, 40);
    y1.userInteractionEnabled =YES;
    [self.view addSubview:y1];
    //阴影2
    UIImageView *y2=[[UIImageView alloc]init];
    y2.image =[UIImage imageNamed:@"阴影2"];
    y2.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    y2.frame =CGRectMake(30, 60, 130, 40);
    y2.userInteractionEnabled =YES;
    [self.view addSubview:y2];
    
    //设置
    UIButton *shezhi =[[UIButton alloc]initWithFrame:CGRectMake(55, 67, 25, 25)];
    [shezhi setBackgroundImage:[UIImage imageNamed:@"设置2"] forState:UIControlStateNormal];
    [self.view addSubview:shezhi];
    //帮助
    UIButton *help =[[UIButton alloc]initWithFrame:CGRectMake(108, 67, 25, 25)];
    [help setBackgroundImage:[UIImage imageNamed:@"帮助"] forState:UIControlStateNormal];
    [self.view addSubview:help];
    //个人中心(阴影1上
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(13, 8, 20, 20)];
    [btn setBackgroundImage:[UIImage imageNamed:@"个人中心按钮"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickgeren) forControlEvents:UIControlEventTouchDown];
    [y1 addSubview:btn];
    //右箭头
    UIButton *right=[[UIButton alloc]initWithFrame:CGRectMake(317, 690, 30, 30)];
    [right setBackgroundImage:[UIImage imageNamed:@"右箭头.png"] forState:UIControlStateNormal];
    [right addTarget:self action:@selector(clickright) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:right];
    //左箭头
    UIButton *left=[[UIButton alloc]initWithFrame:CGRectMake(35, 690, 30, 30)];
    [left setBackgroundImage:[UIImage imageNamed:@"左箭头.png"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(clickleft) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:left];
    
    //功能键
    mid =[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-82, 680, 170, 50)];
    mid.layer.shadowOffset = CGSizeMake(4, 4);
    mid.layer.shadowOpacity = 0.4;
    mid.backgroundColor =[UIColor whiteColor];
    [mid setTitle:mycolor.name forState:UIControlStateNormal];
    [mid setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    mid.titleLabel.font = [UIFont systemFontOfSize: 18.0];
    mid.layer.cornerRadius =10;
    [mid addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:mid];
    
    //森林小院
    NSValue *temp =myp.senlin[mycolor.k];
    Senlin =[[UIView alloc]initWithFrame:[temp CGRectValue]];
    UIImage *image = [UIImage imageNamed:@"森林小院图标"];
    Senlin.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    Senlin.layer.contents = (id) image.CGImage;

    [self.view addSubview:Senlin];
    //空间
    temp =myp.kongjian[mycolor.k];
    Kongjian =[[UIView alloc]initWithFrame:[temp CGRectValue]];
    image = [UIImage imageNamed:@"空间任意门图标"];
    Kongjian.layer.contents = (id) image.CGImage;
    Kongjian.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [self.view addSubview:Kongjian];
    //时间
    temp =myp.shijian[mycolor.k];
    Shijian =[[UIView alloc]initWithFrame:[temp CGRectValue]];
    image = [UIImage imageNamed:@"时光任意门图标"];
    Shijian.layer.contents = (id) image.CGImage;
    Shijian.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [self.view addSubview:Shijian];
    //北极熊
    temp =myp.beijixiong[mycolor.k];
    Beijixiong =[[UIView alloc]initWithFrame:[temp CGRectValue]];
    image = [UIImage imageNamed:@"北极熊图标"];
    Beijixiong.layer.contents = (id) image.CGImage;
    Beijixiong.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [self.view addSubview:Beijixiong];
    
}


//左箭头点击事件（动画
-(void)clickleft{
    CALayer *layer =self.view.layer;
    CABasicAnimation *ani =[CABasicAnimation animationWithKeyPath:@"backgroundcolor"];
    ani.duration=1;
    ani.repeatCount=1;
    [layer addAnimation:ani forKey:@"ani"];
    NSInteger n=3;
    if(!mycolor.k){
        n=3;
    }else{
        n= mycolor.k-1;
    }
    mycolor =[Mycolor gengxincolor:n];
    layer.backgroundColor =[UIColor colorWithRed:[mycolor.redcolor floatValue] green:[mycolor.greecolor floatValue] blue:[mycolor.bluecolor floatValue] alpha:1].CGColor;
   [mid setTitle:mycolor.name forState:UIControlStateNormal];
    
    //动画
    NSValue *temp1 =myp.senlin[mycolor.k];
    NSValue *temp2 =myp.kongjian[mycolor.k];
    NSValue *temp3 =myp.shijian[mycolor.k];
    NSValue *temp4 =myp.beijixiong[mycolor.k];
    [UIView animateWithDuration:0.7 animations:^{
        self->Senlin.frame =[temp1 CGRectValue];
        self->Kongjian.frame =[temp2 CGRectValue];
        self->Shijian.frame =[temp3 CGRectValue];
        self->Beijixiong.frame =[temp4 CGRectValue];
    }];
    
}
//右箭头点击事件（动画
-(void)clickright{
    CALayer *layer =self.view.layer;
    CABasicAnimation *ani =[CABasicAnimation animationWithKeyPath:@"backgroundcolor"];
    ani.duration=1;
    ani.repeatCount=1;
    [layer addAnimation:ani forKey:@"ani"];
    NSInteger n= (mycolor.k+1)%4;
    mycolor =[Mycolor gengxincolor:n];
    layer.backgroundColor =[UIColor colorWithRed:[mycolor.redcolor floatValue] green:[mycolor.greecolor floatValue] blue:[mycolor.bluecolor floatValue] alpha:1].CGColor;
    [mid setTitle:mycolor.name forState:UIControlStateNormal];
    
    //动画
    NSValue *temp1 =myp.senlin[mycolor.k];
    NSValue *temp2 =myp.kongjian[mycolor.k];
    NSValue *temp3 =myp.shijian[mycolor.k];
    NSValue *temp4 =myp.beijixiong[mycolor.k];
    [UIView animateWithDuration:0.7 animations:^{
        self->Senlin.frame =[temp1 CGRectValue];
        self->Kongjian.frame =[temp2 CGRectValue];
        self->Shijian.frame =[temp3 CGRectValue];
        self->Beijixiong.frame =[temp4 CGRectValue];
    }];
}

//个人中心点击事件
-(void)clickgeren{
    gerenViewController *gr=[[gerenViewController alloc]init];
    [self.navigationController pushViewController:gr animated:YES];
    NSLog(@"gerenzhongxin");
    
}
//功能键转跳
-(void)change{
    SenLinXiaoYuanViewController *senlin=[[SenLinXiaoYuanViewController alloc]init];
    KongJianViewController *kongjian=[[KongJianViewController alloc]init];
    TimeDoorsViewController *shijian=[[TimeDoorsViewController alloc]init];
    BeiJiXiongViewController *beijixiong=[[BeiJiXiongViewController alloc]init];
    switch (mycolor.k) {
        case 0:
            [self.navigationController pushViewController:senlin animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:kongjian animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:shijian animated:YES];
            break;
        default:
            [self.navigationController pushViewController:beijixiong animated:YES];
            break;
    }
    
}
@end
