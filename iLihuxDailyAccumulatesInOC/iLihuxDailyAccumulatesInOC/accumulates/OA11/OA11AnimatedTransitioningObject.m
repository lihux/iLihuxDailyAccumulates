//
//  OA11AnimatedTransitioningObject.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/15.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA11AnimatedTransitioningObject.h"

@implementation OA11AnimatedTransitioningObject

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor whiteColor];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.alpha = 0;
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        [fromViewController.view removeFromSuperview];
        [containerView addSubview:toViewController.view];
        [transitionContext completeTransition:finished];
    }];
}

@end
