//
//  OA05CustomOperation.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/10.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OA05CustomOperationDelegate <NSObject>

- (void)finishWork:(NSString *)name;

@end

@interface OA05CustomOperation : NSOperation

@property (nonatomic, weak) id<OA05CustomOperationDelegate> delegate;
- (instancetype)initWithName:(NSString *)name;

@end
