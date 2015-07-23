//
//  LHPullToRefreshView.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/17.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LHPullToRefreshViewPrococal <NSObject>

@property (nonatomic, assign) CGFloat refreshViewHeight;


@end

@interface LHPullToRefreshView : UIView <LHPullToRefreshViewPrococal>

@property (nonatomic, assign) CGFloat refreshViewHeight;

- (void)reframeRefreshView;

@end
