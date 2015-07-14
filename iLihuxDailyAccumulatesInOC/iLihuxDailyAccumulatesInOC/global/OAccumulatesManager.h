//
//  OAccumulatesManager.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/14.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAccumulatesManager : NSObject

@property (nonatomic, strong) NSArray *accumulates;

- (instancetype)initWithPlistFileName:(NSString *)fileName;

@end
