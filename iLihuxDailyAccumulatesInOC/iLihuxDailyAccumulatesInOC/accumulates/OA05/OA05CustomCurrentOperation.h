//
//  OA05CustomCurrentOperation.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/8.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OA05CustomCurrentOperation : NSOperation
{
    BOOL finished;
    NSInteger god;
}

@property (nonatomic, assign) NSInteger god;
- (void)test;

@end
