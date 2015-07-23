//
//  LHPullToRefreshView.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/17.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "LHPullToRefreshView.h"

#import <objc/runtime.h>

typedef enum : NSUInteger {
    LHPullToRefreshViewStateNormal,
    LHPullToRefreshViewStateDragging,
    LHPullToRefreshViewStateThreshold,
} LHPullToRefreshViewState;

@interface LHPullToRefreshView ()

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;

@end

@implementation LHPullToRefreshView

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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.topConstraint.constant = scrollView.contentOffset.y + scrollView.contentInset.top;
    NSLog(@"\n\n\n\n%@, contentInset = %@\n%@\n\n", self, [NSValue valueWithUIEdgeInsets:self.scrollView.contentInset], self);
    return;
}

@end
