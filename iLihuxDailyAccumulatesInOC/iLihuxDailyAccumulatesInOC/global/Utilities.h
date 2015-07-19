//
//  Utilities.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/14.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;
@class OAccumulate;

@interface Utilities : NSObject

+ (NSArray *)loadAccumulatesFromPlistWithPlistFileName:(NSString *)fileName;
+ (UIViewController *)viewControllerForAccumulate:(OAccumulate *)accumulate storyboardName:(NSString *)storyboardName;

@end
