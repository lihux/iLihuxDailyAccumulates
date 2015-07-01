//
//  OA05CustomOperation.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/10.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA05CustomOperation.h"

@implementation OA05CustomOperation

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (void)main
{
    if ([self.delegate respondsToSelector:@selector(finishWork:)]) {
        [self.delegate finishWork:[NSString stringWithFormat:@"来自定制的operation：%@! 天苍苍野茫茫，风吹草低见牛羊", self.name]];
    }
}

@end
