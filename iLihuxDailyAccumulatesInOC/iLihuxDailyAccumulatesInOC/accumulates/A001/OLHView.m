//
//  OLHView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/10.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OLHView.h"

@implementation OLHView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        NSLog(@"里互相：LHView willMoveToSuperview");
    }
}

@end
