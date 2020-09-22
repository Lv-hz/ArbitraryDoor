//
//  SceneDelegate.m
//  ArbitraryDoorsApp
//
//  Created by 林楚婷 on 2020/6/8.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "BeiJiXiongViewController.h"


@interface BeiJiXiongViewController ()<AVAudioPlayerDelegate>

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIImageView *imageView2;
@property(nonatomic,strong) UIButton *backButton;
@property(nonatomic,strong) UIButton *backButton2;
@property(nonatomic,strong) UIImageView *hudongView;
@property(nonatomic) int flag;

@property(nonatomic) UIImageView *snowMan;
@property(nonatomic) UIImageView *snowTemp;   //替换上去的雪人
@property(nonatomic) int snowFlag;

@property(nonatomic) UIButton *change;
@property(nonatomic) int num;   //用来记录歌曲的顺序



@end

@implementation BeiJiXiongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //默认没点击过
    _flag = 0;
    //雪人没移动过
    _snowFlag = 0;
    //歌曲默认为0
    _num = 0;
    
    //背景
    UIImage *image=[UIImage imageNamed:@"北极熊"];
    self.view.layer.contents =(id)image.CGImage;
    
    //更多
    UIButton *gd =[[UIButton alloc]init];
    gd.frame =CGRectMake(320, 45, 40, 40);
    [gd setBackgroundImage:[UIImage imageNamed:@"按钮6"] forState:UIControlStateNormal];
    [self.view addSubview:gd];
    
    //返回
    UIButton *fh =[[UIButton alloc]init];
    fh.frame =CGRectMake(270, 45, 40, 40);
    [fh addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    [fh setBackgroundImage:[UIImage imageNamed:@"按钮5"] forState:UIControlStateNormal];
    [self.view addSubview:fh];
    
    //1
    UIButton *b1 =[[UIButton alloc]init];
    b1.frame =CGRectMake(320, 390, 40, 40);
    [b1 setBackgroundImage:[UIImage imageNamed:@"按钮1"] forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(tanchuang) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b1];
    //2
    UIButton *b2 =[[UIButton alloc]init];
    b2.frame =CGRectMake(320, 450, 40, 40);
    [b2 setBackgroundImage:[UIImage imageNamed:@"按钮2"] forState:UIControlStateNormal];
    [self.view addSubview:b2];
    //3
    UIButton *b3 =[[UIButton alloc]init];
    b3.frame =CGRectMake(320, 510, 40, 40);
    [b3 setBackgroundImage:[UIImage imageNamed:@"按钮3"] forState:UIControlStateNormal];
    [b3 addTarget:self action:@selector(hudong) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b3];
    //4
    UIButton *b4 =[[UIButton alloc]init];
    b4.frame =CGRectMake(320, 570, 40, 40);
    [b4 setBackgroundImage:[UIImage imageNamed:@"按钮4"] forState:UIControlStateNormal];
    [b4 addTarget:self action:@selector(playMusic) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:b4];
}

//退出北极熊冷静岛
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

//装饰弹窗功能
-(void)tanchuang
{
    if(_imageView == NULL)
    {
        //装饰弹窗界面
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"北极熊装饰弹窗"]];
        _imageView.frame = CGRectMake(0, self.view.bounds.size.height-200, self.view.bounds.size.width, 200);
        [self.view addSubview:_imageView];
        
        //雪人
        _snowMan = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"雪人"]];
        _snowMan.frame = CGRectMake(210, 668, 155, 85);
        _snowMan.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
        //创建pan手势
        UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(foundPan:)];
        //设置识别器属性
        recognizer.minimumNumberOfTouches = 1;
        recognizer.maximumNumberOfTouches = 1;
        //关联手势
        [_snowMan addGestureRecognizer:recognizer];
        //开启用户事件
        _snowMan.userInteractionEnabled = YES;
        //添加视图
        [self.view addSubview:_snowMan];
        
        //返回界面
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(17, self.view.bounds.size.height-187, 25, 25)];
        [_backButton setBackgroundColor:[UIColor clearColor]];
        [_backButton addTarget:self action:@selector(clearScreen) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:_backButton];
    }
}

//pan手势
- (void)foundPan:(UIPanGestureRecognizer*)sender
{
    if (_snowFlag == 0)
    {
        //原本的雪人显示
        _snowTemp = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"雪人"]];
        _snowTemp.frame = CGRectMake(210, 668, 155, 85);
        _snowTemp.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
        [self.view addSubview:_snowTemp];
        _snowFlag++;
    }
    if (sender.state != UIGestureRecognizerStateEnded && sender.state != UIGestureRecognizerStateFailed)
    {
        CGPoint location = [sender locationInView:sender.view.superview];
        sender.view.center = location;
    }
}

//装饰推出
-(void)clearScreen
{
    [_backButton removeFromSuperview];
    [_imageView removeFromSuperview];
    [_snowTemp removeFromSuperview];
    _imageView = NULL;
}

//互动功能
-(void)hudong
{
    if(_flag == 0)
    {
        //互动弹窗界面
        _hudongView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"北极熊互动弹窗"]];
        _hudongView.frame = CGRectMake(130, 430, 170, 170);
        _hudongView.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
        [self.view addSubview:_hudongView];
        _flag = 1;
    }
    else
    {
        //点击移除
        [_hudongView removeFromSuperview];
        _flag = 0;
    }
}

//播放音乐功能
-(void)playMusic
{
    if(_imageView2 == NULL)
    {
        //装饰弹窗界面
        _imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"北极熊音乐弹窗1"]];
        //_imageView2.contentMode = UIViewContentModeScaleAspectFit;   //图片自适应
        _imageView2.frame = CGRectMake(0, self.view.bounds.size.height-207, self.view.bounds.size.width, 207);
        [self.view addSubview:_imageView2];
        //返回按钮
        _backButton2 = [[UIButton alloc]initWithFrame:CGRectMake(17, self.view.bounds.size.height-187, 25, 25)];
        [_backButton2 setBackgroundColor:[UIColor clearColor]];
        [_backButton2 addTarget:self action:@selector(clearScreen2) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:_backButton2];
        //切换歌曲
        _change = [[UIButton alloc]initWithFrame:CGRectMake(170, 745, 35, 35)];
        [_change setBackgroundColor:[UIColor clearColor]];
        [_change addTarget:self action:@selector(changeMusic) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:_change];
    
        //后台播放音频设置
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        //以及设置app支持接受远程控制事件代码：
        //让app支持接受远程控制事件
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
        
        //创建音乐播放器
        [self player];
        //开始播放音乐
        [self startPlay];
        
    }
}

//播放音乐退出
-(void)clearScreen2
{
    [_imageView2 removeFromSuperview];
    [_backButton2 removeFromSuperview];
    [_change removeFromSuperview];
    [self stopPlay];
    _imageView2 = NULL;
    //重新初始化一下
    NSError *err;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"背景音乐1" withExtension:@"mp3"];
    _music = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    _num = 0;
}

//初始化播放器
-(AVAudioPlayer*)player{
    if (!_music) {
        NSError *err;
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"背景音乐1" withExtension:@"mp3"];
        _music = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
        _music.delegate = self;
        //获取系统的声音
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        CGFloat currentVol = audioSession.outputVolume;
        //设置播放器声音
        _music.volume = currentVol;
        //设置播放速率
        _music.rate = 1.0;
        //设置播放次数，负数代表无限循环
        _music.numberOfLoops = -1;
        //预加载资源
        [_music prepareToPlay];
    }
    return _music;
}

//开始播放
-(void)startPlay{
    if ([self.music isPlaying]) {
        [self.music stop];
    }
    [self.music play];
    
}

//停止播放
-(void)stopPlay{
    [self.music stop];
}

//暂停播放
-(void)pausePLay{
   [self.music pause];
}

-(void)changeMusic
{
    //暂停播放
    [self stopPlay];
    //定位是什么歌曲
    _num++;
    _num %= 3;
    NSError *err;
    NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"背景音乐%d",_num+1] withExtension:@"mp3"];
    _music = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    [self startPlay];
    //改变背景
    _imageView2.image = [UIImage imageNamed:[NSString stringWithFormat:@"北极熊音乐弹窗%d",_num+1]];
}

#pragma mark -- delegate
// 音频播放完成时
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    NSLog(@"播放完成");
}

// 音频播放出错时
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error{
    NSLog(@"播放出错了");
}
@end

