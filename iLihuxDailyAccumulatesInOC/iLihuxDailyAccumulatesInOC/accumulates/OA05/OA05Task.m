//
//  OA05Task.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/10.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA05Task.h"

@interface OA05Task ()

@property (nonatomic, copy)NSString * name;

@end

@implementation OA05Task

- (instancetype)initWithTaskName:(NSString *)name
{
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (void)beginToughWork
{
    NSLog(@"复杂任务%@开始执行", self.name);
    NSTimeInterval begin = [[NSDate new] timeIntervalSince1970];
    [self calculate];
    NSTimeInterval end = [[NSDate new] timeIntervalSince1970];
    NSTimeInterval consumerTime = end - begin;
    NSLog(@"复杂任务%@执行完毕，运行时间是：%.2f秒", self.name, consumerTime);
}

- (void)beginEasyWork
{
    NSLog(@"简单任务%@执行完毕", self.name);
}

- (double)calculate
{
    double god = NSIntegerMax;
    double dog = 1.23;
    for (int i = 0; i < 30000; i ++) {
        for (int j = 0; j < 10000; j ++) {
            god = god / dog;
        }
    }
    return god;
}

@end
