
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
// NSString *testUrl = @"rtmp://live.hkstv.hk.lxdns.com/live/hks";
NSString *testUrl = @"http://dlhls.cdn.zhanqi.tv/zqlive/49427_jmACJ.m3u8";
[self showPlayerViewWithUrl:testUrl Title:@"视频的标题"];
// 自动播放
[self autoPlay];
}

@end
```

# 监控首页


![image](https://github.com/KeenTeam1990/KTVideoMonitor/blob/master/introductionimages/IMG_0398.png)



# 横屏界面


![image](https://github.com/KeenTeam1990/KTVideoMonitor/blob/master/introductionimages/IMG_0399.png)




# 竖屏界面


![image](https://github.com/KeenTeam1990/KTVideoMonitor/blob/master/introductionimages/IMG_0397.png)




# License
The MIT License (MIT)

Copyright (c) 2016 KEENTEAM

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
