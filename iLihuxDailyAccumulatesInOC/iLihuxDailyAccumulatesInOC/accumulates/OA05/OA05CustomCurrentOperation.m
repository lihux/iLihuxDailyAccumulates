//
//  OA05CustomCurrentOperation.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/8.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA05CustomCurrentOperation.h"

@implementation OA05CustomCurrentOperation

- (void)test
{
    self.god = 0;
    _god = 1;
    god = 2;
    NSLog(@"xxxxx%d, %d, %d", self.god, _god, god);
}

@end
