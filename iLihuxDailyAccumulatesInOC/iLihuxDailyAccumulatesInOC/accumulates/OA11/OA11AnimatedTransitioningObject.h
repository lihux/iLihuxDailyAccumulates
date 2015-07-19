//
//  OA11AnimatedTransitioningObject.h
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/15.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface OA11AnimatedTransitioningObject : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) UITabBarController *tabbarController;

@end
