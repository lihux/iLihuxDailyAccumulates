//
//  LHPullToRefreshView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/17.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "LHPullToRefreshView.h"

#import <objc/runtime.h>

#import "LHPullToRefreshContentView.h"

static const CGFloat kPullToRefreshThreshod = 100;
static const NSInteger kMagicCount = 5;

@interface LHPullToRefreshView ()

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;
@property (nonatomic, assign) LHPullToRefreshViewState pullToRefreshState;
@property (nonatomic, strong) LHPullToRefreshContentView *contentView;
@property (nonatomic, assign) CGFloat originalContentEdgeInsetsTop;
@property (nonatomic, assign) CGFloat thresholdValue;
@property (nonatomic, assign) NSInteger magicCount;
@property (nonatomic, assign) BOOL isAdjusting;
@end

@implementation LHPullToRefreshView

- (instancetype)init
{
    if (self = [super init]) {
        [self customContentView];
        self.pullToRefreshState = LHPullToRefreshViewStateHidden;
        self.thresholdValue = -kPullToRefreshThreshod;
        self.magicCount = 0;
        self.isAdjusting = NO;
    }
    return self;
}

- (void)customContentView
{
    self.contentView = [LHPullToRefreshContentView new];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.contentView];
    NSDictionary *views = @{@"contentView": self.contentView};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[contentView]|" options:0 metrics:0 views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:0 views:views]];
}

- (CGFloat)refreshViewHeight
{
    return 50;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview) {
        [newSuperview addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        self.scrollView = (UIScrollView *)newSuperview;
    } else {
        [self.superview removeObserver:self forKeyPath:@"contentOffset"];
    }
}

- (void)reframeRefreshView
{
    if (self.superview) {
        [self customRefreshViewUsingConstraint];
    }
}

- (void)customRefreshViewUsingConstraint
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = [UIColor redColor];
    NSDictionary *views = NSDictionaryOfVariableBindings(self);
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];

    self.topConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:self.scrollView.contentInset.top];
    self.topConstraint.priority = UILayoutPriorityDefaultHigh;

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];

    [self addConstraint:heightConstraint];
    [self.scrollView addConstraints:@[self.topConstraint, bottomConstraint]];

    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];

    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[self]|" options:NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    
    [self.scrollView setNeedsLayout];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollViewDidScroll:self.scrollView];
    }
}

- (void)setPullToRefreshState:(LHPullToRefreshViewState)pullToRefreshState
{
     NSArray *states = @[@"隐藏状态", @"正常状态", @"触发刷新", @"刷新进行中", @"刷新结束"];
    _pullToRefreshState = pullToRefreshState;
    self.contentView.pullToRefreshState = pullToRefreshState;
    NSLog(@"%@", states[pullToRefreshState]);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.magicCount < kMagicCount) {
        self.magicCount ++;
        return;
    }

    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
    self.topConstraint.constant = offset;
    [self updateRefreshStateUsingOffset:offset];
}

- (void)updateRefreshStateUsingOffset:(CGFloat)offset
{
    if (self.isAdjusting) {
        self.isAdjusting = NO;
        return;
    }
//    NSLog(@"漂移：%lf", offset);
    switch (self.pullToRefreshState) {
        case LHPullToRefreshViewStateHidden:
            self.pullToRefreshState = offset < 0 ? LHPullToRefreshViewStateNormal : LHPullToRefreshViewStateHidden;
            break;
        case LHPullToRefreshViewStateNormal:
            if (offset >= 0) {
                self.pullToRefreshState = LHPullToRefreshViewStateHidden;
            } else if (offset < -50) {
                self.originalContentEdgeInsetsTop = self.scrollView.contentInset.top;
                self.pullToRefreshState = LHPullToRefreshViewStateTriggled;
            }
            break;

        case LHPullToRefreshViewStateTriggled:
            if (offset <= -50 && !self.scrollView.isDragging) {
                self.pullToRefreshState = LHPullToRefreshViewStateLoading;
                if (self.task) {
                    self.task();
                }
            } else if (self.scrollView.isDragging && offset > -50) {
                self.pullToRefreshState = LHPullToRefreshViewStateNormal;
            }
            break;

            case LHPullToRefreshViewStateLoading:
            if (!self.scrollView.isDragging) {
                UIEdgeInsets edgeInset = self.scrollView.contentInset;
                edgeInset.top = offset < -50 ? edgeInset.top : self.originalContentEdgeInsetsTop + 50;
                self.scrollView.contentInset = edgeInset;
                self.pullToRefreshState = LHPullToRefreshViewStateLoading;
            }
            case LHPullToRefreshViewStateLoadingFinished:
            break;

        default:
            break;
    }
}

- (void)finishPullToRefresh
{
    if (self.pullToRefreshState == LHPullToRefreshViewStateLoading) {
        self.pullToRefreshState = LHPullToRefreshViewStateLoadingFinished;
        UIEdgeInsets insets = self.scrollView.contentInset;
        insets.top = self.originalContentEdgeInsetsTop;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.scrollView.contentInset = insets;
        } completion:^(BOOL finished) {
            self.pullToRefreshState = LHPullToRefreshViewStateHidden;
        }];
    }
}

@end
