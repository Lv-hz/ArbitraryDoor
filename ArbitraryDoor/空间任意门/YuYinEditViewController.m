//
//  YuYinEditViewController.m
//  ArbitraryDoor
//
//  Created by 吕泓钊 on 2020/9/17.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "YuYinEditViewController.h"
#import "OverViewController.h"
#import "YunYinContent.h"

@interface YuYinEditViewController ()

<UITextViewDelegate>
@property NSString* content;
@end

@implementation YuYinEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //背景
    UIImage *image=[UIImage imageNamed:@"余音编辑"];
    self.view.layer.contents =(id)image.CGImage;
    
    
    //确认发送
    UIButton *b2 =[[UIButton alloc]init];
    b2.frame =CGRectMake(118, 720, 140, 60);
    b2.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
    [b2 setBackgroundImage:[UIImage imageNamed:@"确认"] forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(success) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b2];
    
    //设置输入框
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(37,200,305,440)];
    //改变边框
    _textView.layer.backgroundColor = [[UIColor clearColor] CGColor];
     _textView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _textView.layer.borderWidth = 1.0;
    [_textView.layer setMasksToBounds:YES];
    //改变字体大小
    [self.textView setFont:[UIFont fontWithName:@"DFPYuanW3" size:23]];
    _textView.delegate = self;
    _textView.autocorrectionType = UITextAutocorrectionTypeYes;//键盘联想
    _textView.returnKeyType = UIReturnKeySend;
    _textView.keyboardType =UIKeyboardTypeDefault;
    [self.view addSubview:_textView];
    _textView.text =[YunYinContent shareYuYinContent].lastcontent;//没有发送或者离开，则编辑内容不变,可继续编辑
    
}

//点击空白处（view）回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textView endEditing:YES];
}
//textview的文字内容获取
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if([text isEqualToString:@"\n"]){
        [textView endEditing:YES];
        _content =_textView.text;
        [YunYinContent shareYuYinContent].lastcontent =_textView.text;
        NSLog(@"%@",_content);
        return NO;
    }
    return YES;
}


-(void)back{
//    mainViewController *main =[[mainViewController alloc]init];
//    [self.navigationController pushViewController:main animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
//编写完成
-(void)success{
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
