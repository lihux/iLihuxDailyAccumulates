//
//  OA06TouchLogView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/13.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA06TouchLogView.h"

@implementation OA06TouchLogView

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        [self printTouch:touch];
    }
    [self printEvent:event];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"移动：%@", event);
    [super touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"结束：%@", event);
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"取消：%@", event);
    [super touchesCancelled:touches withEvent:event];
}

- (void)layoutSubviews
{
    for (UIView *subview in self.subviews) {
        subview.transform = CGAffineTransformMakeRotation(1);
    }
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return self;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return true;
}

- (void)printTouch:(UITouch*)touch
{
//    NSLog(@"一个抚摸：在view：%@", touch);
}

- (void)printEvent:(UIEvent*)event
{
    NSLog(@"一个事件：%@", event);
}


@end
