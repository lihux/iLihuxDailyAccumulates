//
//  OAccumulate.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/17.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "OAccumulate.h"

@implementation OAccumulate

- (instancetype)initWith:(NSString *)title content:(NSString *)content storyboardID:(NSString *)storyboardID
{
    self.title = title;
    self.content = content;
    self.storyboardID = storyboardID;
    return self;
}

@end
