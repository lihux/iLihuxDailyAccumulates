//
//  OA13GlobalHelper.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA13GlobalHelper.h"

#import "OA13StoryObject.h"

@implementation OA13GlobalHelper

+ (NSArray *)storyObjectsFromPlist
{
    NSArray *temp = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OA13" ofType:@"plist"]];
    NSMutableArray *tempDatas = [NSMutableArray array];
    for (NSDictionary *dic in temp) {
        [tempDatas addObject:[[OA13StoryObject alloc] initWithDictionary:dic]];
    }
    return [NSArray arrayWithArray:tempDatas];
}

@end
