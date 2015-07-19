//
//  OA11TabbarTransitionViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/15.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA11TabbarTransitionViewController.h"

#import "OA11AnimatedTransitioningObject.h"

@interface OA11TabbarTransitionViewController () <UITabBarControllerDelegate>

@end

@implementation OA11TabbarTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITabBarControllerDelegate
- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC
{
    OA11AnimatedTransitioningObject *animatiedTransitioningObject = [[OA11AnimatedTransitioningObject alloc] init];
    animatiedTransitioningObject.tabbarController = self;
    return animatiedTransitioningObject;
}

@end
