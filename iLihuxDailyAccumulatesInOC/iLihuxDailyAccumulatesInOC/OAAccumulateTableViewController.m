//
//  OAAccumulateTableView.m
//  
//
//  Created by lihui on 15/7/15.
//
//

#import "OAAccumulateTableViewController.h"

#import "OAccumulate.h"
#import "OAccumulatesManager.h"
#import "Utilities.h"

@interface OAAccumulateTableViewController ()

@property (nonatomic, strong) NSString *plistFileName;
@property (nonatomic, strong) NSString *storyBoardName;
@property (nonatomic, strong) OAccumulatesManager *accumulatesManager;

@end

@implementation OAAccumulateTableViewController

- (void)configTableViewWithPlistFileName:(NSString *)plistName storyBoardName:(NSString *)storyBoardName
{
    self.plistFileName = plistName;
    self.storyBoardName = storyBoardName;
    [self loadAccumulatesFromPlist];
}

- (void)loadAccumulatesFromPlist
{
    self.accumulatesManager = [[OAccumulatesManager alloc] initWithPlistFileName:self.plistFileName];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.accumulatesManager.accumulates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accumulateCell" forIndexPath:indexPath];
    OAccumulate *accumulate = self.accumulatesManager.accumulates[indexPath.row];
    cell.textLabel.text = accumulate.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OAccumulate *accumulate = self.accumulatesManager.accumulates[indexPath.row];
    [self.navigationController pushViewController:[Utilities viewControllerForAccumulate:accumulate storyboardName:self.storyBoardName] animated:YES];
}

@end
