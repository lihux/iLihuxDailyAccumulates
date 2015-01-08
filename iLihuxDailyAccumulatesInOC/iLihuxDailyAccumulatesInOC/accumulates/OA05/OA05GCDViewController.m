//
//  OA05GCDViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/8.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA05GCDViewController.h"

#import "OA05CustomCurrentOperation.h"

@interface OA05GCDViewController ()

@end

@implementation OA05GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test
{
    OA05CustomCurrentOperation *operation = [[OA05CustomCurrentOperation alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
