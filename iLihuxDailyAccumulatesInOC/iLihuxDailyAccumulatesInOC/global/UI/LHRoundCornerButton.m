//
//  LHRoundCornerButton.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/30.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "LHRoundCornerButton.h"

@implementation LHRoundCornerButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.cornerRadius = 4;
    self.clipsToBounds = YES;
}

@end
