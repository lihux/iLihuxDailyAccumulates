//
//  OA13StoryObject.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OA13StoryObject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *backgroundImageName;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
