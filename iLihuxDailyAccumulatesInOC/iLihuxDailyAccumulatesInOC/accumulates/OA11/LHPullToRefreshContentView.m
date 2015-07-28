//
//  LHPullToRefreshContentView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/24.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "LHPullToRefreshContentView.h"

@interface LHPullToRefreshContentView ()

@property (nonatomic, strong) NSArray *infoTexts;

@end

@implementation LHPullToRefreshContentView

- (instancetype)init
{
    if (self = [super init]) {
        self.infoTexts = @[@"松手刷新", @"正在刷新", @"下拉刷新"];
        [self customInfoLabel];
    }
    return self;
}

- (void)customInfoLabel
{
    self.infoLabel = [UILabel new];
    self.infoLabel.textColor = [UIColor blackColor];
    self.infoLabel.text = self.infoTexts[0];
    self.infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.infoLabel];
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self addConstraints:@[centerXConstraint, centerYConstraint]];
}

- (void)layoutSubviews
{
    
}
@end
