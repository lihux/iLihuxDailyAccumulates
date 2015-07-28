//
//  LHPullToRefreshContentView.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/24.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LHPullToRefreshView.h"

@interface LHPullToRefreshContentView : UIView

@property (nonatomic, assign) BOOL loading;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, assign) LHPullToRefreshViewState pullToRefreshState;

@end
