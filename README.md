
### KTVideoMonitor

### 全屏模式 - 效果图

> 基于ijkPlayer的网络播放器，支持HTTP、RTMP、HLS(m3u8)、本地视频等多种格式
>
> 3分钟快速集成播放器，支持小屏、全屏模式，无需手动添加任何依赖库

#### 一、推荐使用`CocoaPods`方式集成
**1、在podfile文件中添加，然后执行 `pod install`操作，文件较大，请耐心等待**

```
pod 'YWVideoPlayer', '~> 1.0.3'
```

**2、`AppDelegate.h` 文件中加入 `fullScreen ` 属性，如下**

```
#import <UIKit/UIKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL fullScreen;

@end
```

**3、在 `AppDelegate.m` 文件中 加入横屏方法（无需调用）**

```
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
if (self.fullScreen == YES) {
return UIInterfaceOrientationMaskAll;
}
return UIInterfaceOrientationMaskPortrait;
}
```

**4、在播放器控制器界面导入头文件**
*Demo 里面是在`BasePlayerViewController`中引入相关头文件*

```
#import "YWMediaPlayerView.h"
```

**5、照着`BasePlayerViewController`文件中的方式去使用即可**

```
// 这里的SecondViewController是继承了BasePlayerViewController
#import "SecondViewController.h"
@interface SecondViewController ()
@end
@implementation SecondViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view.
self.view.backgroundColor = [UIColor whiteColor];

self.isLiveVideo = YES;
[self.view addSubview:self.playerView];

// 测试链接 http、rtmp、m3u8
// NSString *testUrl = @"http://flv2.bn.netease.com/videolib3/1604/28/fVobI0704/SD/fVobI0704-mobile.mp4";
// NSString *testUrl = @"rtmp://ns8.indexforce.com/home/mystream";
NSString *testUrl = @"http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8";
[self showPlayerViewWithUrl:testUrl Title:@"视频的标题"];
// 自动播放
[self autoPlay];
}

@end
```

# 监控首页


![image](https://github.com/KeenTeam1990/KTVideoMonitor/blob/master/introductionimages/IMG_0398.PNG)



# 横屏界面


![image](https://github.com/KeenTeam1990/KTVideoMonitor/blob/master/introductionimages/IMG_0399.PNG)




# 竖屏界面


![image](https://github.com/KeenTeam1990/KTVideoMonitor/blob/master/introductionimages/IMG_0397.PNG)




# License

- 如果您发现了bug请尽可能详细地描述系统版本、手机型号和复现步骤等信息 提一个issue.
- 如果您有什么好的建议也可以提issue,大家一起讨论一起学习进步...
- 具体代码请下载项目  如果觉得喜欢的能给一颗小星星么! ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※
- [有兴趣可以加下创建的QQ群:812144991(因为工作很忙所以可能问问题没人回答!!)](//shang.qq.com/wpa/qunwpa?idkey=ebd8d6809c83b4d6b4a18b688621cb73ded0cce092b4d1f734e071a58dd37c26) <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=294005139&site=qq&menu=yes"></a>
- The MIT License (MIT)                  Copyright (c) 2014 KEENTEAM
