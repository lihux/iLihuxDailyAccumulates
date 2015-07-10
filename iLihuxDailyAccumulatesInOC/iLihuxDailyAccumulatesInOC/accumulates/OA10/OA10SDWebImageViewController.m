//
//  OA10SDWebImageViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/2.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA10SDWebImageViewController.h"

@interface OA10SDWebImageViewController ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation OA10SDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImagesFromAliYunServer];
}

- (void)loadImagesFromAliYunServer
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://120.24.70.94:4000/superCarPhotos/superCar1.jpg"]];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task = [session dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@", data);
    }];
    [task resume];
//    [self.session dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"收到数据：%@, \n********************\n response = %@ \n\n\n error = %@", data, response, error);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
