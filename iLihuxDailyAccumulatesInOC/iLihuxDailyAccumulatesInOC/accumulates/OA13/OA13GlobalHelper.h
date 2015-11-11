//
//  OA13GlobalHelper.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OA13StoryObject;

@protocol OA13DemoCollectionViewCellDelegate <NSObject>

@required
- (void)configCellWithStoryObject:(OA13StoryObject *) storyObject;

@end

@interface OA13GlobalHelper : NSObject

+ (NSArray *)storyObjectsFromPlist;

@end
