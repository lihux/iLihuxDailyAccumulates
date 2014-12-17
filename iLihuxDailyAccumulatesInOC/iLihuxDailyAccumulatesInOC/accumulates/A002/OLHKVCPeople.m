//
//  OLHKVCPeople.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/15.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OLHKVCPeople.h"

#include "OLHKVCAddress.h"

@interface OLHKVCPeople ()

@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int gender; //male:0  female:1
@property (nonatomic, assign) OLHKVCAddress* address;

@end

@implementation OLHKVCPeople

- (instancetype)initWithAddress:(OLHKVCAddress *)address name:(NSString *)name
{
    if (self = [super init]) {
        self.address = address;
        self.name = name;
    }
    return  self;
}

@end
