//
//  LHPullToRefreshView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/17.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "LHPullToRefreshView.h"

typedef enum : NSUInteger {
    LHPullToRefreshViewStateNormal,
    LHPullToRefreshViewStateDragging,
    LHPullToRefreshViewStateThreshold,
} LHPullToRefreshViewState;

@interface LHPullToRefreshView ()

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation LHPullToRefreshView

- (CGFloat)refreshViewHeight
{
    return 50;
}

@end
