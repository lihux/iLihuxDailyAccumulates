//
//  LHKVCPeople.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/15.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "LHKVCPeople.h"

#include "LHKVCAddress.h"

@interface LHKVCPeople ()

@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int gender; //male:0  female:1
@property (nonatomic, assign) LHKVCAddress* address;

@end

@implementation LHKVCPeople

- (instancetype)initWithAddress:(LHKVCAddress *)address name:(NSString *)name
{
    if (self = [super init]) {
        self.address = address;
        self.name = name;
    }
    return  self;
}

@end
