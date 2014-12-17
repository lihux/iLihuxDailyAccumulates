//
//  OLHTextView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/15.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OLHTextView.h"

@implementation OLHTextView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([self pointInside:point withEvent:event] && [self isTappedOnNameText:point]) {
        return self;
    }
    return nil;
}

- (BOOL)isTappedOnNameText:(CGPoint)point
{
    point.x -= self.textContainerInset.left;
    point.y -= self.textContainerInset.top;
    NSUInteger index = [self.layoutManager characterIndexForPoint:point inTextContainer:self.textContainer fractionOfDistanceBetweenInsertionPoints:nil];
    if (index < self.textStorage.length) {
        if ([self.attributedText attribute:@"fuck" atIndex:index effectiveRange:nil]) {
            return true;
        }
    }
    return false;
}

@end
