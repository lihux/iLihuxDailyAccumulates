//
//  OA11PullToRefreshViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/17.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA11PullToRefreshViewController.h"

#import "LHPullToRefreshView.h"
#import "UIScrollView+LHPullToRefresh.h"

@interface OA11PullToRefreshViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) LHPullToRefreshView *refreshView;

@end

@implementation OA11PullToRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configScrollView];
}

- (void)configScrollView
{
    self.scrollView.delegate = self;
    self.scrollView.superview.tag = 1000;
    [self.scrollView addPullToRefreshWithBlock:^{
        NSLog(@"下拉刷新进行中，我在干活，哈哈哈哈");
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            UIImageView *temp = (UIImageView *)view;
            temp.alpha = 1;
            temp.backgroundColor = [UIColor greenColor];
            [temp removeFromSuperview];
            [self.scrollView addSubview:temp];
            NSLog(@"我勒个去：%@", temp);
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"滑动：%lf", scrollView.contentOffset.y + scrollView.contentInset.top);
}

@end
