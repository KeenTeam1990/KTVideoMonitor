//
//  UIView+YWExtend.h
//  YWIjkPlayer
//
//  Created by Candy on 2017/10/10.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//

#import <UIKit/UIKit.h>

// 是否横竖屏
// 用户界面横屏了才会返回YES
#define IS_LANDSCAPE UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])
// 无论支不支持横屏，只要设备横屏了，就会返回YES
#define IS_DEVICE_LANDSCAPE UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])

// 屏幕宽度，会根据横竖屏的变化而变化
#define YWSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
// 屏幕高度，会根据横竖屏的变化而变化
#define YWSCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

// 屏幕宽度，跟横竖屏无关
#define YWDEVICE_WIDTH (IS_LANDSCAPE ? YWSCREEN_HEIGHT : YWSCREEN_WIDTH)
// 屏幕高度，跟横竖屏无关
#define YWDEVICE_HEIGHT (IS_LANDSCAPE ? YWSCREEN_WIDTH : YWSCREEN_HEIGHT)

// 当前窗口
#define YWWindow [[UIApplication sharedApplication].delegate window]

// 小屏模式高度
#define YWMinPlayerHeight (YWSCREEN_WIDTH / 16 * 9)

@interface UIView (YWExtend)


@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;


@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat radius;


@property (nonatomic, assign) CGFloat   insideCenterX;
@property (nonatomic, assign) CGFloat   insideCenterY;
@property (nonatomic, assign) CGPoint   insideCenter;


/**
 *  自动从xib创建视图
 */
+(instancetype)viewFromXIB;


/*
 *  计算frame
 */
+(CGRect)frameWithW:(CGFloat)w h:(CGFloat)h center:(CGPoint)center;


/**
 *  添加一组子view：
 */
-(void)addSubviewsWithArray:(NSArray *)subViews;


/**
 *  批量移除视图
 *
 *  @param views 需要移除的视图数组
 */
+(void)removeViews:(NSArray *)views;

/**
 *  添加边框:四边
 */
-(void)setBorder:(UIColor *)color width:(CGFloat)width;



/**
 *  获取viewController
 */
- (UIViewController*)viewController;


/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:      虚线的颜色
 **/
- (void)drawDashLine:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 *  查找NVG 的分割线 ---- navigationBar
 */
+ (UIImageView*)findHairlineImageViewUnder:(UIView*)view;


#pragma mark - subView操作
/**
 *  查找指定类型的subView 每个族列只有一次有效
 */
- (void)findSubView:(Class)subView action:(void(^)(NSArray *subViews))actionBlock;



@end
