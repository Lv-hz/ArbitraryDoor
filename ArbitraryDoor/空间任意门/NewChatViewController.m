//
//  NewChatViewController.m
//  ArbitraryDoor
//
//  Created by 吕泓钊 on 2020/9/17.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "NewChatViewController.h"
#import "YuYinViewController.h"

#define W ([UIScreen mainScreen].bounds.size.width)
#define H ([UIScreen mainScreen].bounds.size.height)


@interface NewChatViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UITextViewDelegate
>
@property int count;
@property int isleft;
@end

@implementation NewChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //计数
    self.count=0;
    self.isleft=0;
    //导航栏
    self.view.backgroundColor =[UIColor colorWithRed:100/255.0 green:161/255.0 blue:203/255.0 alpha:1.0];
    self.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
    
    //self.navigationItem.title = @"空间任意门";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSForegroundColorAttributeName:[UIFont systemFontOfSize:18]}];
    
    //导航栏左侧按钮
    UIButton *backbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 27)];
    //[backbutton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backbutton setImage:[UIImage imageNamed:@"菜单"] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventAllTouchEvents];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backbutton];
    self.navigationItem.leftBarButtonItem = backItem;
    //导航栏右侧按钮
    UIButton *morebutton = [[UIButton alloc] initWithFrame:CGRectMake(W*0.9, H, 25, 25)];
    [morebutton setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    UIBarButtonItem *moreItem = [[UIBarButtonItem alloc] initWithCustomView:morebutton];
    self.navigationItem.rightBarButtonItem = moreItem;
    
    //导航栏中间按钮
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(20, 20, 40, 40);
    [button setImage:[UIImage imageNamed:@"电源"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.titleView =button;
    
    
    //uiview
    self.background  =[[UIView alloc]initWithFrame:CGRectMake(10, H * 0.92+4, W * 0.93, H * 0.058)];
    self.background.backgroundColor =[UIColor whiteColor];
    self.background.layer.cornerRadius =25;
    [self.view addSubview: self.background];
    

    
    //设置输入框
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(W * 0.17, H * 0.93+2, W * 0.59, H * 0.04)];
    //改变边框
    _textView.layer.backgroundColor = [[UIColor clearColor] CGColor];
     _textView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _textView.layer.borderWidth = 1.0;
    [_textView.layer setMasksToBounds:YES];
    //改变字体大小
    [self.textView setFont:[UIFont fontWithName:@"DFPYuanW3" size:18]];
    _textView.delegate = self;
    _textView.autocorrectionType = UITextAutocorrectionTypeNo;//键盘联想
    _textView.returnKeyType = UIReturnKeySend;
    _textView.keyboardType =UIKeyboardTypeDefault;
   

    //设置表情按钮
    self.b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.b1 setImage:[UIImage imageNamed:@"表情"] forState:UIControlStateNormal];
    self.b1.frame = CGRectMake(W * 0.73, H * 0.93, W * 0.15, H * 0.05);
    //设置添加按钮
    self.b2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.b2 setImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
    self.b2.frame = CGRectMake(W * 0.82, H * 0.93, W * 0.15, H * 0.05);
    //设置语音按钮
    self.b3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.b3 setImage:[UIImage imageNamed:@"语音"] forState:UIControlStateNormal];
    self.b3.frame = CGRectMake(12, H * 0.93, W * 0.15, H * 0.05);
    
    
    [self.view addSubview:_textView];
    [self.view addSubview: self.b1];
    [self.view addSubview:self.b2];
    [self.view addSubview:self.b3];
    

    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H -70) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //设置分割线(设置为无样式)
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.showsVerticalScrollIndicator = NO;
    
    //设置tableview背景
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, W, H-72)];
    imageView.image =[UIImage imageNamed:@"聊天背景"];
    [_tableView setBackgroundView:imageView];
    _tableView.backgroundColor =[UIColor clearColor];
    
    
    [self.view addSubview:_tableView];

    
    //设置聊天信息数值
    _messageArr = [NSMutableArray arrayWithObjects:@"（系统消息）恭喜您，匹配成功，请注意文明用语哦！",   nil];
    _left_messageArr = [NSMutableArray arrayWithObjects:@"（系统消息）恭喜您，匹配成功，请注意文明用语哦！",   nil];
    _rowHeightArr = [[NSMutableArray alloc] init];
    for (NSString *str in _messageArr) {
        //因为boundingRectWithSize: options: attributes: context: 函数中参数三需要使用字典数组
        //P1:文本显示的最大宽度和最大高度
        //P2:计算的类型 NSStringDrawingUsesLineFragmentOrigin 绘制文本时使用，一般使用这项
        //P3:文本属性
        //P4:包括一些信息，例如如何调整字间距以及缩放。该参数一般可为 nil
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        CGSize size = [str boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.41) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        //聊天框高度，+ W * 0.15为了保持会话之间的距离
        int height = size.height + W * 0.15;
        _rowHeight = [NSNumber numberWithInt:height];
        //存储在数组里，设置行高时使用
        [_rowHeightArr addObject:_rowHeight];
    }
    //监视键盘回收
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];


    
}
/******************键盘的收回****************************/
//点击或者滑动tableview使键盘回收
-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    return indexPath;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
    [_textView resignFirstResponder];
}
//点击空白处（view）回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textView endEditing:YES];
}

/*****************键盘上升  键盘下降*************************/
//显示简单的键盘回收
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    
    //计算键盘高度
    NSValue *value =[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize =[value CGRectValue].size;
    float keyboardHeight =keyboardSize.height;
    //第一个参数是动画持续时间
    //第二个参数是方法，这里让视图恢复原来的位置就好
    //下降
    if(self.messageArr.count<4){
    [UIView animateWithDuration:0.1 animations:^{
        self.tableView.frame =CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height+keyboardHeight);
        self.b1.frame =CGRectMake(self.b1.frame.origin.x, self.b1.frame.origin.y+keyboardHeight, self.b1.frame.size.width, self.b1.frame.size.height);
        self.b2.frame =CGRectMake(self.b2.frame.origin.x, self.b2.frame.origin.y+keyboardHeight, self.b2.frame.size.width, self.b2.frame.size.height);
        self.b3.frame =CGRectMake(self.b3.frame.origin.x, self.b3.frame.origin.y+keyboardHeight, self.b3.frame.size.width, self.b3.frame.size.height);
        self.background.frame =CGRectMake(self.background.frame.origin.x, self.background.frame.origin.y+keyboardHeight, self.background.frame.size.width, self.background.frame.size.height);
        self.textView.frame =CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y+keyboardHeight, self.textView.frame.size.width, self.textView.frame.size.height);
    }];
    //计数
    self.count--;
    }
    else{
        [UIView animateWithDuration:0.2 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
    }
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    
    //计算键盘高度
    NSValue *value =[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize =[value CGRectValue].size;
    float keyboardHeight =keyboardSize.height;
    NSLog(@"%f",keyboardHeight);
    if(self.count==0&&self.messageArr.count<4)
    {
    //上升
    [UIView animateWithDuration:0.1 animations:^{
        self.tableView.frame =CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height-keyboardHeight);
        self.b1.frame =CGRectMake(self.b1.frame.origin.x, self.b1.frame.origin.y-keyboardHeight, self.b1.frame.size.width, self.b1.frame.size.height);
        self.b2.frame =CGRectMake(self.b2.frame.origin.x, self.b2.frame.origin.y-keyboardHeight, self.b2.frame.size.width, self.b2.frame.size.height);
        self.b3.frame =CGRectMake(self.b3.frame.origin.x, self.b3.frame.origin.y-keyboardHeight, self.b3.frame.size.width, self.b3.frame.size.height);
        self.background.frame =CGRectMake(self.background.frame.origin.x, self.background.frame.origin.y-keyboardHeight, self.background.frame.size.width, self.background.frame.size.height);
        self.textView.frame =CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y-keyboardHeight, self.textView.frame.size.width, self.textView.frame.size.height);
    }];
    //计数
    self.count++;
    }
    if(self.count==0j&&self.messageArr.count>=4)
    {
        //计算键盘高度
        CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardY = keyboardFrame.origin.y;
        //视图整体上升
        [UIView animateWithDuration:0.2 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);
        }];
    }
    
}

/*************其他函数************************/

-(void)more{
    YuYinViewController *yuyin =[[YuYinViewController alloc]init];
    [self.navigationController pushViewController:yuyin animated:YES];

}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    //导航栏
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    //导航栏
    [self.navigationController setNavigationBarHidden:NO];
    //隐藏导航栏的分割线
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

/********************tableview相关****************************/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    } else {
        //tableView的复用，如果不删除，会出现bug
        //删除cell所有的子视图
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    //分割线风格（无显示）
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor =[UIColor clearColor];
    
    if(indexPath.row==0||self.isleft==1)
    {
        //设置头像
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed: @"image1"]];
        imageView.frame = CGRectMake(W * 0.03, W * 0.05, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        //设置对话框
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArr[indexPath.row];//聊天内容
        label.font = [UIFont fontWithName:@"DFPYuanW3" size:18];   //设置字体
        NSDictionary *attri = @{NSFontAttributeName:label.font};
        //自适应高度
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.56) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(W * 0.18, W * 0.065, size.width, size.height + W * 0.04);
        
        //设置聊天气泡
        UIImageView *imageViewBubble = [[UIImageView alloc] init];
        //imageViewBubble.backgroundColor =[UIColor whiteColor];
        UIImage *image=[UIImage imageNamed:@"气泡1"];
        imageViewBubble.image =image;
        imageViewBubble.layer.cornerRadius =7;//yuanjiao
        imageViewBubble.frame = CGRectMake(W * 0.15, W * 0.07, size.width + W * 0.07, size.height + W * 0.05);
        
        [cell.contentView addSubview:imageViewBubble];
        [cell.contentView addSubview:label];
    }
    else{
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
        imageView.frame = CGRectMake(W * 0.87, W * 0.01, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArr[indexPath.row];//聊天内容
        label.font = [UIFont fontWithName:@"DFPYuanW3" size:18];   //设置字体
        NSDictionary *attri = @{NSFontAttributeName:label.font};
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.54) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(W * 0.791 - size.width, W * 0.04+5, size.width, size.height);
        
          //设置字体颜色
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:label.text];
        [text addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, text.length)];
        label.attributedText =text;
        
        
        
        UIImageView *imageViewBubble = [[UIImageView alloc] init];
        //聊天气泡颜色
        //imageViewBubble.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        UIImage *image=[UIImage imageNamed:@"气泡2"];
        imageViewBubble.image =image;
        imageViewBubble.frame = CGRectMake(W * 0.75 - size.width, W * 0.03, size.width + W * 0.09, size.height + W * 0.07);
        imageViewBubble.layer.cornerRadius =7;
        [cell.contentView addSubview:imageViewBubble];
        [cell.contentView addSubview:label];
    }
    
    return cell;
    
}
//设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //将NSNumber型的height转换为CGFloat型
    CGFloat height = [_rowHeightArr[indexPath.row] floatValue];
    return height;
}
//个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messageArr.count;
}

//利用textview的代理方法处理发送
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{

    if ([text isEqualToString:@"\n"]) //获取键盘中发送事件（回车事件）
    {
        [textView endEditing:YES];
        self.isleft =0;//标识符
        //发送消息
        [_messageArr addObject:_textView.text];
        [_right_messageArr addObject:_textView.text];
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        //自适应高度，并计算
        CGSize size = [_textView.text boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        int height = size.height + W * 0.15;
        _rowHeight = [NSNumber numberWithInt:height];
        [_rowHeightArr addObject:_rowHeight];
        //_messageArr.count - 1 ： 显示的最后一行
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(_messageArr.count - 1) inSection:0];
        //加入一个cell
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        //更新tableView
        [_tableView reloadData];
        //滚动界面（随着消息发送上移）
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        //清空textField
        _textView.text = @"";

    }

    return YES;
}

/***********收到消息*****************/
//收到消息时调用，传入收到的消息（字符串）
-(void)recieveleft_Message:(NSString *)leftmessage
{
    self.isleft =1;//标识符
    
    [_messageArr addObject:leftmessage];
    [_left_messageArr addObject:leftmessage];
    NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    //自适应高度，并计算
    CGSize size = [leftmessage boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    int height = size.height + W * 0.15;
    _rowHeight = [NSNumber numberWithInt:height];
    [_rowHeightArr addObject:_rowHeight];
    //_messageArr.count - 1 ： 显示的最后一行
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(_messageArr.count - 1) inSection:0];
    //加入一个cell
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    //更新tableView
    [_tableView reloadData];
    //滚动界面（随着消息发送上移）
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}

@end
