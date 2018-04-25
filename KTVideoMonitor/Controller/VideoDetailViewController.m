//
//  VideoDetailViewController.m
//  EasySchool
//
//  Created by keenteam on 2018/4/18.
//  Copyright © 2018年 keenteam. All rights reserved.
//

#pragma mark - 获取屏幕宽度
#define kWidth [UIScreen mainScreen].bounds.size.width
#pragma mark - 获取屏幕高度
#define kHeight [UIScreen mainScreen].bounds.size.height
#define YXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#import "VideoDetailViewController.h"
#import "YWMediaPlayerView.h"
#import "AppDelegate.h"
#import "HHControl.h"
@interface VideoDetailViewController ()<YWMediaPlayerViewDelegate>
@property (nonatomic, strong)YWMediaPlayerView  *mediaPlayerView;
@property (nonatomic, strong)UIView             *playerView;
@end

@implementation VideoDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //确保在该控制器即将出现的时候开启全屏模式
     ((AppDelegate *) [[UIApplication sharedApplication] delegate]).fullScreen = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 确保在该控制器即将消失的时候关闭全屏模式
    ((AppDelegate *) [[UIApplication sharedApplication] delegate]).fullScreen = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftItemBar];
    [self play];
}

/**创建左导航按钮*/
- (void)createLeftItemBar{
    
    self.view.backgroundColor =  YXColor(245, 245, 245);
    [self.navigationController.navigationBar setBarTintColor:YXColor(0, 0, 0)];
    self.title = self.titleName;
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
    
    UIButton * leftBtn  = [HHControl backItemWithimage:[UIImage imageNamed:@"navigationButtonReturnClick"] highImage:[UIImage imageNamed:@"navigationButtonReturn"]  target:self action:@selector(clickLeftBtn) title:@"返回"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
}

- (void)play{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight)];
    _playerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_playerView];
    
    _mediaPlayerView = [[YWMediaPlayerView alloc]init];
    [_mediaPlayerView playerViewWithUrl:self.vedioUrl WithTitle:@"高二（1班）美术教室" WithView:_playerView  WithDelegate:self];
    
    _mediaPlayerView.mediaControl.totalDurationLabel.hidden = YES;
    _mediaPlayerView.mediaControl.mediaProgressSlider.hidden = YES;
    _mediaPlayerView.mediaControl.currentTimeLabel.hidden = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 自动播放
        [_mediaPlayerView.mediaControl playControl];
    });
    
}

/// 改变View大小布局
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft ||
        [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _mediaPlayerView.frame = CGRectMake(0, 0, size.width,size.height);
        _mediaPlayerView.player.view.frame = CGRectMake(0, 0, size.width,size.height);
        _mediaPlayerView.mediaControl.fullScreenBtn.selected = YES;
        _mediaPlayerView.isFullScreen = YES;
        [window addSubview:_mediaPlayerView];
    } else {
        _mediaPlayerView.frame = CGRectMake(0, 0, kWidth, kHeight);
        _mediaPlayerView.player.view.frame = CGRectMake(0, 0, size.width, size.width/16*9);
        _mediaPlayerView.mediaControl.fullScreenBtn.selected = YES;
        _mediaPlayerView.isFullScreen = YES;
        [_mediaPlayerView playerViewWithUrl:self.vedioUrl WithTitle:@"" WithView:_playerView WithDelegate:self];
        //[_playerView addSubview:_mediaPlayerView];
        [self.view addSubview:_playerView];
    }
}

/**点击返回按钮*/
- (void)clickLeftBtn{
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
