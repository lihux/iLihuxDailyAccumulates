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
static char kLHPullToRefreshViewTopConstraint;

@interface UIScrollView (LHPullToRefresh)

@property (nonatomic, strong) NSLayoutConstraint *topConstraint;

@end

@implementation UIScrollView (LHPullToRefresh)

- (UIView *)pullToRefreshView
{
    return objc_getAssociatedObject(self, &kLHPullToRefreshView);
}

- (NSLayoutConstraint *)topConstraint
{
    return objc_getAssociatedObject(self, &kLHPullToRefreshViewTopConstraint);
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
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        if (self.constraints) {
            [self customRefreshViewUsingConstraint];
        } else {
            [self customRefreshViewUsingAutoResizing];
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollViewDidScroll:self];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.constraints) {
        self.topConstraint.constant = scrollView.contentOffset.y + scrollView.contentInset.top;
        [self.pullToRefreshView layoutIfNeeded];
        NSLog(@"%@", [NSValue valueWithUIEdgeInsets:self.pullToRefreshView.layoutMargins]);
        if (scrollView.contentOffset.y < -50 - 64) {
            NSLog(@"\n\n\n\n%@, contentInset = %@\n%@\n\n", self, [NSValue valueWithUIEdgeInsets:self.contentInset], self.pullToRefreshView);
            //        NSLog(@"%@", [self.pullToRefreshView constraintsAffectingLayoutForAxis:UILayoutConstraintAxisVertical]);
        }
    }
}

- (void)customRefreshViewUsingConstraint
{
    LHPullToRefreshView *refreshView = self.pullToRefreshView;
    refreshView.translatesAutoresizingMaskIntoConstraints = NO;
    refreshView.backgroundColor = [UIColor redColor];
    NSDictionary *views = NSDictionaryOfVariableBindings(refreshView);
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:refreshView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];

    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:refreshView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:self.contentInset.top];
    topConstraint.priority = UILayoutPriorityDefaultHigh;
    
    [self willChangeValueForKey:@"topConstraint"];
    objc_setAssociatedObject(self, &kLHPullToRefreshViewTopConstraint, topConstraint, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"topConstraint"];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:refreshView
                                                                        attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    

    [refreshView addConstraint:heightConstraint];
    [self addConstraints:@[topConstraint, bottomConstraint]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:refreshView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[refreshView]|" options:NSLayoutFormatAlignAllBottom metrics:nil views:views]];

    [self setNeedsLayout];
}

- (void)customRefreshViewUsingAutoResizing
{
    LHPullToRefreshView *refreshView = self.pullToRefreshView;
    CGRect frame = CGRectMake(0, - refreshView.refreshViewHeight, self.bounds.size.width, refreshView.refreshViewHeight);
    refreshView.frame = frame;
    refreshView.backgroundColor = [UIColor redColor];
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

@end
