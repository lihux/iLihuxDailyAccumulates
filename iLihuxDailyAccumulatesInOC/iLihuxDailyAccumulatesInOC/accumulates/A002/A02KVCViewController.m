//
//  A02KVCViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/15.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "A02KVCViewController.h"

#import "LHKVCPeople.h"
#import "LHKVCAddress.h"

@interface A02KVCViewController ()

@property (nonatomic, strong) LHKVCPeople *lihux;

@end

@implementation A02KVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self kvcTest];
}

- (void)kvcTest
{
    LHKVCAddress *address = [[LHKVCAddress alloc] init];
    self.lihux = [[LHKVCPeople alloc] initWithAddress:address name:@"李雷"];
    NSString *name = [self.lihux valueForKeyPath:@"name"];
    NSString *streetName = [self.lihux valueForKeyPath:@"address.streetName"];
    NSLog(@"通过KVC的方式访问到了%@的streetName = %@", name, streetName);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
