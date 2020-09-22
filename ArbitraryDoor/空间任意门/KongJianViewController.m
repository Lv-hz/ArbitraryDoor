//
//  KongJianViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/8.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "KongJianViewController.h"
#import "NewChatViewController.h"


@interface KongJianViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *item;
    UIProgressView *progressview;
    UIImageView *ani;
    UIImageView *ani2;
    UIImageView *p1;
    UIImageView *p2;
    NSString *pick;
    UIPickerView *picker;
}

@end

@implementation KongJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景
    UIImage *image=[UIImage imageNamed:@"空间背景"];
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
    
    //匹配
    UIButton *pp =[[UIButton alloc]init];
    pp.frame =CGRectMake(142, 465, 100, 50);
    pp.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [pp setBackgroundImage:[UIImage imageNamed:@"空间匹配"] forState:UIControlStateNormal];
    [pp addTarget:self action:@selector(pipei) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:pp];
    
    //选择
    self->picker =[[UIPickerView alloc]initWithFrame:CGRectMake(58, 375, 250, 80)];
    picker.delegate =self;
    picker.dataSource =self;
    NSArray *arr=@[@"无",@"生活",@"工作",@"情感",@"学习"];
    item =arr;
    [self.view addSubview:picker];
    
    //进度条
    progressview = [[UIProgressView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-300)/2, 700, 300, 20)];
    progressview.trackTintColor = [UIColor whiteColor];//背景颜色
    progressview.progressViewStyle = UIProgressViewStyleDefault;//样式
    progressview.tintColor = [UIColor colorWithRed:50/255.0 green:120/255.0 blue:214/255.0 alpha:1.0];//已完成进度颜色
    progressview.progress = 0.0;//现在的进度
    progressview.transform = CGAffineTransformMakeScale(1.0f, 3.0f);//改变高度
    [self.view addSubview:progressview];
    
    //开门动画
    ani =[[UIImageView alloc]initWithFrame:CGRectMake(70, 80, 230, 230)];
    ani.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    ani.image =[UIImage imageNamed:@"空间任意门0"];
    [self.view addSubview:ani];
    NSMutableArray *imagearray =[[NSMutableArray alloc]init];
    for(int i=0;i<15;i++)
    {
        UIImage * image =[UIImage imageNamed:[NSString stringWithFormat:@"空间任意门%d",i]];
        [imagearray addObject:image];
    }
    ani.animationImages =imagearray;
    ani.animationDuration =2;//seconds
    ani.animationRepeatCount =1;
    
    //响应点击事件
    ani.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ClickImage)];
    [ani addGestureRecognizer:singleTap];
    
    //熊动画
    ani2 =[[UIImageView alloc]initWithFrame:CGRectMake(64, 490, 210, 210)];
    ani2.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    ani2.image =[UIImage imageNamed:@"bear1"];
    [self.view addSubview:ani2];
    NSMutableArray *imagearray2 =[[NSMutableArray alloc]init];
    for(int i=1;i<4;i++)
    {
        UIImage * image =[UIImage imageNamed:[NSString stringWithFormat:@"bear%d",i]];
        [imagearray2 addObject:image];
    }
    ani2.animationImages =imagearray2;
    ani2.animationDuration =1;
    ani2.animationRepeatCount =5;
    
    
    //匹配中 匹配成功
    p1 =[[UIImageView alloc]initWithFrame:CGRectMake(156, 720, 90, 45)];
    p1.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    p1.image =[UIImage imageNamed:@"匹配中"];
    p1.alpha =0.0;
    [self.view addSubview:p1];
    p2 =[[UIImageView alloc]initWithFrame:CGRectMake(142, 720, 90, 45)];
    p2.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    p2.image =[UIImage imageNamed:@"匹配成功"];
    p2.alpha =0.0;
    [self.view addSubview:p2];
}


//action
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
// 进入聊天界面
-(void)ClickImage{
    NSLog(@"图片被点击!");
    NewChatViewController *chatvc =[[NewChatViewController alloc]init];
    [self.navigationController pushViewController:chatvc animated:YES];
}
//动画效果
-(void)pipei{
    p1.alpha =1.0;
    p2.alpha =0.0;
    [progressview setProgress:0.0 animated:YES];
    //动画
    [UIView animateWithDuration:5 animations:^{
        [self->progressview setProgress:1.0 animated:YES];
        self->p1.alpha =0.0;
        [self->ani2 startAnimating];
        
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1 animations:^{
            self->p2.alpha =1.0;
        }];
        [self->ani startAnimating];
        self->ani.image =[UIImage imageNamed:@"空间任意门14"];
        self->ani2.image =[UIImage imageNamed:@"bear1"];
    }];
    
    //获取选中项
    NSInteger row=[self->picker selectedRowInComponent:0];
    pick = [item objectAtIndex:row];//nsstring类型
    NSLog(@"%@",pick);
}

//uipickerview
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 5;
}
- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [item objectAtIndex:row];
}
//获取用户当前选中的选项
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//   
//    pick = [item objectAtIndex:row];
//    NSLog(@"%@",pick);
//}

@end

