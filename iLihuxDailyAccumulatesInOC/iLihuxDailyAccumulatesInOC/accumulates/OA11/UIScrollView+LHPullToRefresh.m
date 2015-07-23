//
//  UIScrollView+LHPullToRefresh.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/20.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "UIScrollView+LHPullToRefresh.h"

#import <objc/runtime.h>
#import "LHPullToRefreshView.h"

static char kLHPullToRefreshView;

@implementation UIScrollView (LHPullToRefresh)

- (UIView *)pullToRefreshView
{
    return objc_getAssociatedObject(self, &kLHPullToRefreshView);
}

- (void)setPullToRefreshView:(UIView *)pullToRefreshView
{
    [self willChangeValueForKey:@"LHPullToRefreshView"];
    objc_setAssociatedObject(self, &kLHPullToRefreshView, pullToRefreshView, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"LHPullToRefreshView"];
}

- (void)addPullToRefreshWithBlock:(pullToRefreshBlock)block
{
    if (!self.pullToRefreshView) {
        LHPullToRefreshView *refreshView = [LHPullToRefreshView new];
        refreshView.translatesAutoresizingMaskIntoConstraints = NO;
        self.pullToRefreshView = refreshView;
        [self addSubview:self.pullToRefreshView];
        [self.pullToRefreshView reframeRefreshView];
    }
}

@end
