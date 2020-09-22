//
//  gerenViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/7.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "gerenViewController.h"
#import "mainViewController.h"
#import "DengLuViewController.h"
#import "SceneDelegate.h"
@interface gerenViewController ()


@end

@implementation gerenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"个人中心"];
    self.view.layer.contents =(id)image.CGImage;
    
    //返回
    UIButton *fh =[[UIButton alloc]init];
    fh.frame =CGRectMake(30, 48, 55, 20);
    [fh setBackgroundImage:[UIImage imageNamed:@"返回键"] forState:UIControlStateNormal];
    [fh addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:fh];
    
    //退出登录
    UIButton *tc =[[UIButton alloc]init];
    tc.frame =CGRectMake(self.view.bounds.size.width/2-55, 750, 100, 36);
    [tc setTitle:@"退出登录" forState:UIControlStateNormal];
    tc.backgroundColor=[UIColor darkGrayColor];
    [tc addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchDown];
    tc.layer.cornerRadius =10;
    [self.view addSubview:tc];
//
//    NSArray *familyNames = [UIFont familyNames];
//    for( NSString *familyName in familyNames ) {
//        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
//        for( NSString *fontName in fontNames ) {
//            printf( "\tFontName: %s \n", [fontName UTF8String] );
//        }
//    }
}
//返回
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
//退出登录
-(void)exit{
    DengLuViewController *degnlu=[[DengLuViewController alloc]init];
    [self.navigationController pushViewController:degnlu animated:YES];
    //状态改变
    SceneDelegate *app = [[SceneDelegate alloc]init];
    app.issignin=0;
    [[NSUserDefaults standardUserDefaults]setInteger:app.issignin forKey:@"issignin"];//存
    NSLog(@"退出登录");
}
@end
