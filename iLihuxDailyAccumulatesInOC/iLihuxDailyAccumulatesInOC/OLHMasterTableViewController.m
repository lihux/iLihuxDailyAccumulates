//
//  OLHMasterTableViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/9.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OLHMasterTableViewController.h"

@interface OLHMasterTableViewController ()

@end

@implementation OLHMasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self configTableViewWithPlistFileName:@"OAccumulates" storyBoardName:@"Main"];
}

@end
