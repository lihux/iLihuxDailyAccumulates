//
//  LHPullToRefreshView.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/17.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LHPullToRefreshViewStateHidden,
    LHPullToRefreshViewStateNormal,
    LHPullToRefreshViewStateTriggled,
    LHPullToRefreshViewStateLoading,
    LHPullToRefreshViewStateLoadingFinished,
} LHPullToRefreshViewState;

@protocol LHPullToRefreshViewPrococal <NSObject>

@property (nonatomic, assign) CGFloat refreshViewHeight;

@end

typedef void(^taskBlock)();

@interface LHPullToRefreshView : UIView <LHPullToRefreshViewPrococal>

@property (nonatomic, assign) CGFloat refreshViewHeight;
@property (nonatomic, assign) BOOL triggerPullToRefresh;
@property (nonatomic, copy) taskBlock task;

- (void)reframeRefreshView;
- (void)finishPullToRefresh;

@end
