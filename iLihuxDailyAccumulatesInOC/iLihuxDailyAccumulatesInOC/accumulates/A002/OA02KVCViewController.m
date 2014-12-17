//
//  OA02KVCViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/15.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OA02KVCViewController.h"

#import "OLHKVCPeople.h"
#import "OLHKVCAddress.h"

@interface OA02KVCViewController ()

@property (nonatomic, strong) OLHKVCPeople *lihux;

@end

@implementation OA02KVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self kvcTest];
}

- (void)kvcTest
{
    OLHKVCAddress *address = [[OLHKVCAddress alloc] init];
    self.lihux = [[OLHKVCPeople alloc] initWithAddress:address name:@"李雷"];
    NSString *name = [self.lihux valueForKeyPath:@"name"];
    NSString *streetName = [self.lihux valueForKeyPath:@"address.streetName"];
    NSLog(@"通过KVC的方式访问到了%@的streetName = %@", name, streetName);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
