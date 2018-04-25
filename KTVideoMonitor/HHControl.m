//
//  HHControl.m
//  MyUility
//    ___  _____   ______  __ _   _________
//   / _ \/ __/ | / / __ \/ /| | / / __/ _ \
//  / , _/ _/ | |/ / /_/ / /_| |/ / _// , _/
// /_/|_/___/ |___/\____/____/___/___/_/|_|
//  Created by kt on 14-10-10.
//  Copyright (c) 2014年 keenteam. All rights reserved.
//

#import "HHControl.h"

@implementation HHControl

#pragma mark 创建UIButton
+ (UIButton *)backItemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  backButton;
}

#pragma mark 创建UILable
+(UILabel *)createLabelWithFrame:(CGRect )frame Font:(int)font Text:(NSString *)text{
    
    UILabel * myLabel = [[UILabel alloc]initWithFrame:frame];
    myLabel.numberOfLines = 0;//限制行数
    myLabel.textAlignment = NSTextAlignmentLeft;//对齐的方式
    myLabel.backgroundColor = [UIColor clearColor];//背景色
    myLabel.font = [UIFont systemFontOfSize:font];//字号
    myLabel.textColor = [UIColor blackColor];//颜色默认是白色，现在默认是黑色
    myLabel.lineBreakMode = NSLineBreakByCharWrapping;
    /*
     UIBaselineAdjustmentAlignBaselines文本最上端和label的中线对齐
     UIBaselineAdjustmentAlignCenters 文本中线和label中线对齐
     UIBaselineAdjustmentNone  文本最下端和label中线对齐
     */
    myLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    myLabel.text = text;
    
    return myLabel;
}

+(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField * textField = [[UITextField alloc]initWithFrame:frame];
    textField.font = font;
    textField.textColor = [UIColor grayColor];
    textField.borderStyle = UITextBorderStyleNone;
    textField.placeholder = placeholder;
    
    return textField;
}

#pragma mark 创建UIButton
+(UIButton *)createButtonWithFrame:(CGRect)frame backGruondImageName:(NSString *)name Target:(id)target Action:(SEL)action Title:(NSString *)title{
    
    UIButton * myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.frame = frame;
    [myButton setTitle:title forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (name) {
        [myButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];

    }
    [myButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return myButton;
}
#pragma mark 创建UIImageView
+(UIImageView *)createImageViewWithFrame:(CGRect )frame ImageName:(NSString *)imageName{
    
    UIImageView * myImageView = [[UIImageView alloc]initWithFrame:frame];
    myImageView.userInteractionEnabled = YES;//开启用户交互属性
    myImageView.image = [UIImage imageNamed:imageName];
    
    return myImageView;
}
#pragma mark 创建UITextField
+(UITextField *)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder passWord:(BOOL)yesOrNo leftImageView:(UIImageView *)imageView rightImageView:(UIImageView *)rightImageView Font:(float)font{
    UITextField * myField = [[UITextField alloc]initWithFrame:frame];//设置灰色的提示文字
    myField.textAlignment = NSTextAlignmentLeft;//文字的对齐方式
    myField.secureTextEntry = yesOrNo;//是否是密码
    //边框设置
    myField.borderStyle = UIKeyboardTypeDefault;//键盘的类型
    myField.autocapitalizationType = NO;//关闭首字母大写
    myField.clearButtonMode = YES;//清除按钮
    
    myField.leftView = imageView;//左边图片
    myField.leftViewMode = UITextFieldViewModeAlways;
    
    myField.rightView = rightImageView;
    myField.rightViewMode = UITextFieldViewModeWhileEditing;
    
    myField.font = [UIFont systemFontOfSize:font];//设置字号
    myField.textColor = [UIColor blackColor];//设置字体颜色
    myField.placeholder = placeholder;
    
    return myField;
}
#pragma mark 创建UISscrollView
+(UIScrollView *)createScrollViewWithFram:(CGRect)frame andSize:(CGSize)size{
    UIScrollView * myScrollView = [[UIScrollView alloc]initWithFrame:frame];
    return myScrollView;
}
#pragma mark 创建UIPageControl
+(UIPageControl *)createPageControlWithFram:(CGRect )frame andNumberPage:(NSInteger)number{
    UIPageControl * myPageController = [[UIPageControl alloc]initWithFrame:frame];
    myPageController.numberOfPages = number;
    return myPageController;
}
#pragma mark 创建UISlider
+(UISlider *)createSliderWithFrame:(CGRect)frame andImgaeName:(UIImage *)name{
    UISlider * slider = [[UISlider alloc]initWithFrame:frame];
    slider.minimumValue = 0;
    slider.maximumValue = 1;
    return slider;
}
#pragma mark -创建UIImageView-------
+(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
    
    if (imageName)
    {
        imageView.image = [UIImage imageNamed:imageName];
    }
    if (color)
    {
        imageView.backgroundColor = color;
    }
    
    return imageView;
}

#pragma mark -----字典转json-----------------
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError =nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

#pragma mark -----调整日期格式-----------------
+ (NSString *)htcTimeToLocationStr:(NSString*)strM
{
    //输入格式
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDate * dateFormatted = [dateFormatter dateFromString:strM];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString * locationTimeString = [dateFormatter stringFromDate:dateFormatted];
    
    return locationTimeString;
}

#pragma mark -----调整日期格式-----------------
+ (NSString *)htcTimeToLocationShortStr:(NSString*)strM
{
    //输入格式
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDate * dateFormatted = [dateFormatter dateFromString:strM];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * locationTimeString = [dateFormatter stringFromDate:dateFormatted];
    
    return locationTimeString;
}

+ (NSString *)htcTimeToStr:(NSString*)strM
{
    //输入格式
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDate * dateFormatted = [dateFormatter dateFromString:strM];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString * locationTimeString = [dateFormatter stringFromDate:dateFormatted];
    
    return locationTimeString;
}


+ (NSString *)htcTimeToLocationDate
{
   //读取手机系统时间
   NSDate * senddate = [NSDate date];
   NSDateFormatter  * dateformatter = [[NSDateFormatter alloc] init];
   [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm"];
   NSString * locationString=[dateformatter stringFromDate:senddate];
   return locationString;
}

+ (NSString *)htcTimeToDate
{
    //读取手机系统时间
    NSDate * senddate = [NSDate date];
    NSDateFormatter  * dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy年MM月dd日"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError * err;
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:jsonData
    options:NSJSONReadingMutableContainers       error:&err];
    
    if(err) {
        
       // NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    return dic;
    
}

+ (NSString *)htcExchangeTimeToStr:(NSString*)strM
{
    //输入格式
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDate * dateFormatted = [dateFormatter dateFromString:strM];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString * locationTimeString = [dateFormatter stringFromDate:dateFormatted];
    
    return locationTimeString;
}


@end











