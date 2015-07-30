//
//  OA12JSPatchViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/30.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA12JSPatchViewController.h"

@implementation OA12JSPatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configTableViewWithPlistFileName:@"OA12" storyBoardName:@"OA12"];
}

@end
