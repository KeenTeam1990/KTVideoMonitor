//
//  YWMediaGesturesView.m
//  YWIjkPlayer
//
//  Created by Candy on 2017/10/10.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//

#import "YWMediaGesturesView.h"

@implementation YWMediaGesturesView

-(id)initWithFrame:(CGRect)frame{
    

    if (self==[super initWithFrame:frame]) {
        
    }
    return self;
    
}
//触摸开始
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    //获取触摸开始的坐标
    UITouch *touch = [touches anyObject];
    CGPoint currentP = [touch locationInView:self];
    
   // NSLog(@"获取触摸坐标%@",NSStringFromCGPoint(currentP));
    [self.delegate touchesBeganWith:currentP];
    
}
//触摸结束
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint currentP = [touch locationInView:self];
    //NSLog(@"获取触摸结束坐标%@",NSStringFromCGPoint(currentP));
}
//移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentP = [touch locationInView:self];
   // NSLog(@"获取移动坐标%@",NSStringFromCGPoint(currentP));
//    [self touchesMoveWithPoint:currentP];
    
    [self.delegate touchesMovedWith:currentP];
    
    
}
- (void)touchesMoveWithPoint:(CGPoint)point{
    
    
    
    
}
@end
