//
//  OA03TouchEventTableViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/15.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OA03TouchEventTableViewController.h"

#import "OLHTextView.h"
#import "OLHTouchEventTableViewCell.h"

@interface OA03TouchEventTableViewController ()

@property (nonatomic, strong)OLHTextView *textView;

@end

@implementation OA03TouchEventTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView = [[OLHTextView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OLHTouchEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell configCell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"现在，此时此刻，你选中我了");
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
