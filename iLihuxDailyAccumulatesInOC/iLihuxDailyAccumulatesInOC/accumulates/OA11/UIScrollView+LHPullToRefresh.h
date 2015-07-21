//
//  UIScrollView+LHPullToRefresh.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/20.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHPullToRefreshView;

typedef void(^pullToRefreshBlock)();

@interface UIScrollView (LHPullToRefresh)

@property (nonatomic, strong, readonly) LHPullToRefreshView *pullToRefreshView;

- (void)addPullToRefreshWithBlock:(pullToRefreshBlock)block;

@end
