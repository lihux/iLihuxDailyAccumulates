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

@interface OA11PullToRefreshViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) LHPullToRefreshView *refreshView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation OA11PullToRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configScrollView];
}

- (void)configScrollView
{
    [self.tableView addPullToRefreshWithBlock:^{
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
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%@", scrollView);
//    NSLog(@"%@", self.tableView.pullToRefreshView);
//    NSLog(@"滑动：%lf", scrollView.contentOffset.y + scrollView.contentInset.top);
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"god"];
    cell.textLabel.text = @"天蓬元帅";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //使用纯代码的方式测试下拉刷新view的布局是否有问题：
    UITableViewController *tableViewController = [UITableViewController new];
    [tableViewController.tableView addPullToRefreshWithBlock:^{
        NSLog(@"我欲乘风归去");
    }];
    [self.navigationController pushViewController:tableViewController animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

@end
