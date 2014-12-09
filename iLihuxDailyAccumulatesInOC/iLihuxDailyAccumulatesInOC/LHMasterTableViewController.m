//
//  LHMasterTableViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/9.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "LHMasterTableViewController.h"

@interface AccumulateObject : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) NSString* storyboardID;

@end

@implementation AccumulateObject

- (instancetype)initWith:(NSString *)title content:(NSString *)content storyboardID:(NSString *)storyboardID
{
    self.title = title;
    self.content = content;
    self.storyboardID = storyboardID;
    return self;
}

@end

@interface LHMasterTableViewController ()

@property (nonatomic, strong) NSArray *accumulates;

@end

@implementation LHMasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAccumulatesFromPlist];
}

- (void)loadAccumulatesFromPlist
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"accumulates" ofType:@"plist"];
    NSArray *tempArray = [NSArray arrayWithContentsOfFile:plistPath];
    if (tempArray.count > 0) {
        NSMutableArray *tempAccumulates = [NSMutableArray array];
        for (NSDictionary* dic in tempArray) {
            NSString *title = dic[@"title"];
            NSString *content = dic[@"content"];
            NSString *storyboardID = dic[@"storyboardID"];
            [tempAccumulates addObject:[[AccumulateObject alloc] initWith:title content:content storyboardID:storyboardID]];
        }
        self.accumulates = [NSArray arrayWithArray:tempAccumulates];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.accumulates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accumulateCell" forIndexPath:indexPath];
    AccumulateObject *accumulate = self.accumulates[indexPath.row];
    cell.textLabel.text = accumulate.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AccumulateObject *accumulate = self.accumulates[indexPath.row];
    UIViewController *accumulateViewController = [self.storyboard instantiateViewControllerWithIdentifier:accumulate.storyboardID];
    [self.navigationController pushViewController:accumulateViewController animated:YES];
}

@end
