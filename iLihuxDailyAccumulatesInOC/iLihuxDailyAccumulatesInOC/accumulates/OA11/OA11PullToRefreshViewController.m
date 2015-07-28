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

#import "SVPullToRefresh.h"

@interface OA11PullToRefreshViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) LHPullToRefreshView *refreshView;

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
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView finishPullToRefresh];
        });
    }];
    [self.tableView triggerPullToRefresh];
}

- (void)insertRowAtTop {
    __weak typeof(self) weakSelf = self;
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [weakSelf.tableView.pullToRefreshView stopAnimating];
    });
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    __weak UITableViewController *weakTableViewController = tableViewController;
    [tableViewController.tableView addPullToRefreshWithBlock:^{
        NSLog(@"我欲乘风归去");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakTableViewController.tableView finishPullToRefresh];
        });
    }];
    [self.navigationController pushViewController:tableViewController animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

@end
