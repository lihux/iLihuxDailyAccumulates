//
//  A01InputConstraintViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/9.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "A01InputConstraintViewController.h"

#import "LHView.h"

@interface A01InputConstraintViewController ()

@end

@implementation A01InputConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    LHView *god = [LHView new];
    [self.view addSubview:god];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
