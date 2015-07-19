//
//  OA11AllAnimationTableViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/15.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA11AllAnimationViewController.h"

@interface OA11AllAnimationViewController ()

@end

@implementation OA11AllAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configTableViewWithPlistFileName:@"OA11" storyBoardName:@"OA11"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
