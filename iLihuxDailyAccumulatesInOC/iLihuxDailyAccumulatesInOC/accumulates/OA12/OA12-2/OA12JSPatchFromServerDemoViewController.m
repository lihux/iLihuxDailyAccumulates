//
//  OA12JSPatchFromServerDemoViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/30.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA12JSPatchFromServerDemoViewController.h"

#import "JPEngine.h"
#import "MBHUDHelper.h"
#import "MBProgressHUD.h"

@interface OA12JSPatchFromServerDemoViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation OA12JSPatchFromServerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[@"天", @"地", @"人和"];
}

- (IBAction)didTapOnCrashButton:(id)sender
{
    NSLog(@"数据源是：%@", self.data[4]);
}

- (IBAction)didTapOnLoadingButton:(id)sender
{
    [JPEngine startEngine];
    [MBHUDHelper showWarningWithText:@"正在尝试从Lihux的阿里云服务器请求JS文件"];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://120.24.70.94:4000/superCarPhotos/lihuxJSPatch.js"]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *script = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [JPEngine evaluateScript:script];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
