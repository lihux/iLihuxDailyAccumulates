//
//  LHPullToRefreshView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/17.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "LHPullToRefreshView.h"

static const CGFloat kPullToRefreshViewDefaultHeight = 40;

typedef enum : NSUInteger {
    LHPullToRefreshViewStateNormal,
    LHPullToRefreshViewStateDragging,
    LHPullToRefreshViewStateThreshold,
} LHPullToRefreshViewState;

@interface LHPullToRefreshView ()

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation LHPullToRefreshView

- (void)setScrollView:(UIScrollView *)scrollView
{
    self.frame = CGRectMake(0, -kPullToRefreshViewDefaultHeight, scrollView.bounds.size.width, kPullToRefreshViewDefaultHeight);
    self.backgroundColor = [UIColor greenColor];
    _scrollView = scrollView;
    [self observeScrollView];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    if (!newSuperview) {
        [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
    } else if (newSuperview && [newSuperview isKindOfClass:[UIScrollView class]]) {
        self.scrollView = (UIScrollView *)newSuperview;
    }
}

- (void) observeScrollView
{
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollViewDidScroll:self.scrollView];
    }
}

- (CGFloat)contentOffsetYForScrollView:(UIScrollView *)scrollView
{
    return scrollView.contentOffset.y + self.scrollView.contentInset.top;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = [self contentOffsetYForScrollView:scrollView];
    if (y < -1 * kPullToRefreshViewDefaultHeight) {
        NSLog(@"你太过分了啊！！！");
    }
}

- (void)closePullToRefresh
{
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)dealloc
{
    NSLog(@"正宗的开始释放啦");
}

@end
