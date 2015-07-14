//
//  OAccumulatesManager.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/14.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OAccumulatesManager.h"

#import "Utilities.h"

@interface OAccumulatesManager ()

@property (nonatomic, strong) NSString *fileName;

@end

@implementation OAccumulatesManager

- (instancetype)initWithPlistFileName:(NSString *)fileName
{
    if (self = [super init]) {
        self.fileName = fileName;
        [self loadAccumulatesFromPlistFile];
    }
    return self;
}

- (void)loadAccumulatesFromPlistFile
{
    self.accumulates = [Utilities loadAccumulatesFromPlistWithPlistFileName:self.fileName];
}

@end
