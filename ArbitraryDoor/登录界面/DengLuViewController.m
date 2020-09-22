//
//  DengLuViewController.m
//  RenYiMen
//
//  Created by 吕泓钊 on 2020/5/5.
//  Copyright © 2020 吕泓钊. All rights reserved.
//

#import "DengLuViewController.h"
#import "mainViewController.h"
#import "SceneDelegate.h"
#import "ZhuCeViewController.h"

@interface DengLuViewController ()<UITextFieldDelegate>
{
    NSString *zh;
}
@property (weak, nonatomic) IBOutlet UITextField *zhanghao;
@property (weak, nonatomic) IBOutlet UITextField *mima;
@property (weak, nonatomic) IBOutlet UIButton *denglu;
@property (weak, nonatomic) IBOutlet UIButton *zhuce;

@end

@implementation DengLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self.navigationController setNavigationBarHidden:YES];
    //背景
    UIImage *image=[UIImage imageNamed:@"登录注册"];
    self.view.layer.contents =(id)image.CGImage;
    
    
    self.denglu.layer.cornerRadius =23;
    [self.denglu addTarget:self action:@selector(clickdl) forControlEvents:UIControlEventTouchDown];
    [self.zhuce addTarget:self action:@selector(clickzc) forControlEvents:UIControlEventTouchDown];
    self.zhanghao.clearsOnBeginEditing =NO;
    self.zhanghao.placeholder =@"账号";
    self.mima.placeholder =@"密码";
    self.zhanghao.keyboardType =UIKeyboardTypeDefault;
    self.zhanghao.autocorrectionType = UITextAutocorrectionTypeNo;//键盘联想
    //输入内容
    [self.zhanghao addTarget:self action:@selector(textFieldEditChanged:)forControlEvents:UIControlEventEditingChanged];
}

-(void)clickdl{
    
    if([zh isEqual:@"13723000001"]){
        SceneDelegate *scene = [[SceneDelegate alloc]init];
        scene.issignin = 1;
        [[NSUserDefaults standardUserDefaults]setInteger:scene.issignin forKey:@"issignin"];//存
        mainViewController *main =[[mainViewController alloc]init];
        [self.navigationController pushViewController:main animated:YES];
        NSLog(@"登录");
    }
    else{
        UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Sorry" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        [self presentViewController:alert animated:YES completion:nil];
        /*
         UIAlertControllerStyleActionSheet = 0,
         UIAlertControllerStyleAlert
         */
        
        NSLog(@"错误");
    }
    
}

//监听输入内容
- (void)textFieldEditChanged:(UITextField*)textField
{
    zh =textField.text;
    NSLog(@"%@",textField.text);
    
}

//关键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.zhanghao endEditing:YES];
    [self.mima endEditing:YES];
}

//注册
-(void)clickzc{
    ZhuCeViewController *zc=[[ZhuCeViewController alloc]init];
    [self.navigationController pushViewController:zc animated:YES];
}

@end
