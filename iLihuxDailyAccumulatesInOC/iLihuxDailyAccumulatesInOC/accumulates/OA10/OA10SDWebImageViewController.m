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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation OA10SDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImagesFromAliYunServer];
}

- (void)loadImagesFromAliYunServer
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://120.24.70.94:4000/superCarPhotos/superCar1.jpg"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.imageView.image = [UIImage imageWithData:data];
        NSLog(@"%@", data);
    }];
    
//    request.HTTPMethod = @"get";
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSURLSessionTask *sessionTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"%@", data);
//    }];
//    [sessionTask resume];
//    NSMutableURLRequest *request = [nsmuta requestWithURL:[NSURL URLWithString:@"http://120.24.70.94:4000/superCarPhotos/superCar1.jpg"]];
//    request.HTTPMethod = @"get";
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSURLSessionTask *task = [session dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"%@", data);
//    }];
//    [task resume];
//    [self.session dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"收到数据：%@, \n********************\n response = %@ \n\n\n error = %@", data, response, error);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
