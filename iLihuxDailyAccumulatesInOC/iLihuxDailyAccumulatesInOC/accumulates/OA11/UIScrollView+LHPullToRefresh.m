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

@implementation UIScrollView (LHPullToRefresh)

- (UIView *)pullToRefreshView
{
    return objc_getAssociatedObject(self, &kLHPullToRefreshView);
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
        self.pullToRefreshView = refreshView;
        [self addSubview:self.pullToRefreshView];
        
        if (self.constraints) {
            [self customRefreshViewUsingConstraint];
        } else {
            [self customRefreshViewUsingAutoResizing];
        }
    }
}

- (void)customRefreshViewUsingConstraint
{
    LHPullToRefreshView *refreshView = self.pullToRefreshView;
    refreshView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *contentView = [self realContentView];
    NSDictionary *views = NSDictionaryOfVariableBindings(refreshView, contentView);
    NSDictionary *metrics = @{@"kRefreshViewHeight": @50.0};
    [refreshView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[refreshView(>=kRefreshViewHeight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[refreshView]|" options:NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    if (contentView) {
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:refreshView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:contentView
                                                                      attribute:NSLayoutAttributeTop
                                                                     multiplier:1.0 constant:0];
        [refreshView addConstraint:constraint];
    }
    [self setNeedsLayout];
}

- (UIView *)realContentView
{
    for (UIView *view in self.subviews) {
        if ( (![view isKindOfClass:[UIImageView class]]) && view != self.pullToRefreshView) {
            return view;
        }
    }
    return nil;
}

- (void)customRefreshViewUsingAutoResizing
{
    LHPullToRefreshView *refreshView = self.pullToRefreshView;
    CGRect frame = CGRectMake(0, - refreshView.refreshViewHeight, self.bounds.size.width, refreshView.refreshViewHeight);
    refreshView.frame = frame;
    refreshView.backgroundColor = [UIColor redColor];
}

@end
