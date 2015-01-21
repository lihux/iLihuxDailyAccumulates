//
//  OA07View.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/19.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA07View.h"

@implementation OA07View

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint superPoint = [self convertPoint:point toView:self.superview];
    CGPoint presentationPoint = [self.layer.presentationLayer convertPoint:superPoint fromLayer:self.superview.layer];
//    CGPoint superPoint = [self convertPoint:point toView:self.superview];
//    superPoint = [self.layer.presentationLayer convertPoint:superPoint fromLayer:self.superview.layer];
    NSLog(@"in hit test : %@", NSStringFromCGPoint(point));
    return [super hitTest:presentationPoint withEvent:event];
}

- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event
{
    CABasicAnimation* basicAnimation = (CABasicAnimation *)[super actionForLayer:layer forKey:event];
    NSLog(@"\n门西-event = %@", event);
    if (![basicAnimation isKindOfClass:[NSNull class]]) {
        NSLog(@"\n%s, \n", object_getClassName(basicAnimation));
    }


    return basicAnimation;
}

@end
