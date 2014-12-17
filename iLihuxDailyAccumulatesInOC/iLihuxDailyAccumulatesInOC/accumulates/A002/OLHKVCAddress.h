//
//  OLHKVCAddress.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 14/12/15.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OLHKVCAddress : NSObject

@property (nonatomic, strong) NSString* streetName;
@property (nonatomic, assign) int streetNumber;

- (instancetype)init;

@end
