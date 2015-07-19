//
//  Utilities.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/14.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "Utilities.h"

#import "OAccumulate.h"
#import <UIKit/UIKit.h>

@implementation Utilities

+ (NSArray *)loadAccumulatesFromPlistWithPlistFileName:(NSString *)fileName
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSArray *accumulates = [NSArray array];
    NSArray *tempArray = [NSArray arrayWithContentsOfFile:plistPath];
    if (tempArray.count > 0) {
        NSMutableArray *tempAccumulates = [NSMutableArray array];
        for (NSDictionary* dic in tempArray) {
            NSString *title = dic[@"title"];
            NSString *content = dic[@"content"];
            NSString *storyboardID = dic[@"storyboardID"];
            [tempAccumulates addObject:[[OAccumulate alloc] initWith:title content:content storyboardID:storyboardID]];
        }
        accumulates = [NSArray arrayWithArray:tempAccumulates];
    }
    return accumulates;
}

+ (UIViewController *)viewControllerForAccumulate:(OAccumulate *)accumulate storyboardName:(NSString *)storyboardName
{
    UIViewController *accumulateViewController = [[UIStoryboard storyboardWithName:storyboardName bundle: nil] instantiateViewControllerWithIdentifier:accumulate.storyboardID];
    accumulateViewController.title = accumulate.title;
    return accumulateViewController;
}

@end
