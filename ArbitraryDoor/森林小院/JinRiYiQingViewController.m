//
//  JinRiYiQingViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/28.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "JinRiYiQingViewController.h"

@interface JinRiYiQingViewController ()

@end

@implementation JinRiYiQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //navigation
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.title = @"今日疫情";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSForegroundColorAttributeName:[UIFont systemFontOfSize:18]}];
    
    //导航栏左侧按钮
    UIButton *backbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 30)];
    [backbutton setImage:[UIImage imageNamed:@"森林返回"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventAllTouchEvents];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backbutton];
    self.navigationItem.leftBarButtonItem = backItem;
    
        // 1.创建webview
        CGFloat width = self.view.frame.size.width;
        CGFloat height = self.view.frame.size.height;
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        
        
        // 2.1 创建一个远程URL
        NSURL *remoteURL = [NSURL URLWithString:@"https://voice.baidu.com/act/newpneumonia/newpneumonia/?from=osari_pc_3"];
        
        // 2.2 创建一个本地URL
        NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"first" ofType:@"html"];
        NSURL *locationURL = [NSURL URLWithString:urlStr];
        
        // 3.创建Request
        NSURLRequest *request =[NSURLRequest requestWithURL:remoteURL];
        // 4.加载网页
        [webView loadRequest:request];
        // 5.最后将webView添加到界面
        [self.view addSubview:webView];

}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    //显示导航栏
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
}



@end
