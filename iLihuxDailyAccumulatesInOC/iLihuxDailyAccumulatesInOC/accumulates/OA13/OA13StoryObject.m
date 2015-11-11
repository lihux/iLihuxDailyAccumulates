//
//  OA13StoryObject.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA13StoryObject.h"

@implementation OA13StoryObject

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.title = dic[@"title"];
        self.content = dic[@"content"];
        self.backgroundImageName = dic[@"image"];
    }
    return self;
}

@end
