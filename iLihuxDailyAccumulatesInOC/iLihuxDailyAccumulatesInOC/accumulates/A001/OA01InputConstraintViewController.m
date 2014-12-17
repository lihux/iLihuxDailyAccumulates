//
//  OA01InputConstraintViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/9.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OA01InputConstraintViewController.h"

#import "OLHView.h"

@interface OA01InputConstraintViewController ()

@end

@implementation OA01InputConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    OLHView *god = [OLHView new];
    [self.view addSubview:god];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
