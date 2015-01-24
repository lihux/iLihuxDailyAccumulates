//
//  OA08LayerAnimationViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/22.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA08LayerAnimationViewController.h"

#import "OA08AlbumImageView.h"

@interface OA08LayerAnimationViewController ()

@property (weak, nonatomic) IBOutlet OA08AlbumImageView *imageView;

@end

@implementation OA08LayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"qq"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
