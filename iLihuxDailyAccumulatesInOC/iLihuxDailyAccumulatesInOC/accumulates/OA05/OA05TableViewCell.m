//
//  OA05TableViewCell.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/9.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA05TableViewCell.h"

@implementation OA05TableViewCell

- (void)awakeFromNib {
    self.textLabel.font = [UIFont fontWithName:@"STHeitiTC-Light" size:15];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.backgroundColor = [UIColor clearColor];
    UIView *selectedBackgroundView = [UIView new];
    selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self setSelectedBackgroundView:selectedBackgroundView];
}

@end
