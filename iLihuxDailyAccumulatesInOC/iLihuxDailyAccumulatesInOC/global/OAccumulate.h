//
//  OAccumulate.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/17.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAccumulate : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) NSString* storyboardID;

- (instancetype)initWith:(NSString *)title content:(NSString *)content storyboardID:(NSString *)storyboardID;

@end
