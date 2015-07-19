//
//  OA11PullToRefreshViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/17.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA11PullToRefreshViewController.h"

#import "LHPullToRefreshView.h"

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
    self.refreshView = [LHPullToRefreshView new];
    [self.scrollView addSubview:self.refreshView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"我勒个去：%@", scrollView);
}

- (void)dealloc
{
    [self.refreshView closePullToRefresh];
}

@end
