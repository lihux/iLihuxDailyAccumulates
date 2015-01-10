//
//  OA05Task.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/10.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OA05Task : NSObject

- (instancetype)initWithTaskName:(NSString *)name;
- (void)beginToughWork;
- (void)beginEasyWork;

@end
