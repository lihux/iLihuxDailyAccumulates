//
//  OA10SDWebImageViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/2.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA10SDWebImageViewController.h"

@interface OA10SDWebImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation OA10SDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImagesFromAliYunServer];
}

- (void)loadImagesFromAliYunServer
{
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://120.24.70.94:4000/superCarPhotos/superCar1.jpg"] completionHandler:^(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"%@", data);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = [UIImage imageWithData:data];
            });
        }
    }];
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
