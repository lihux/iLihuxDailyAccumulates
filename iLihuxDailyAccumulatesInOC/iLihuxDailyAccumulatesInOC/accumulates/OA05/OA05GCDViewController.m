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
    [operation test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
