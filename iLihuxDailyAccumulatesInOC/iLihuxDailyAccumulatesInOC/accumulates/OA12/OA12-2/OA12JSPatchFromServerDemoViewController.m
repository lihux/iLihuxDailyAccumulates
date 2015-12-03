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
    self.data = @[@"天苍苍", @"野茫茫", @"风吹草低见牛羊"];
}

//defineClass('OA12JSPatchFromServerDemoViewController', {
//didTapOnCrashButton: function(sender) {
//    if (sender.tag() > 2) {
//        require("MBHUDHelper").showWarningWithText("对不起，我已才思枯竭了，不要再点了");
//    } else {
//        self.ORIGdidTapOnCrashButton(sender);
//    }
//}
//})

- (IBAction)didTapOnCrashButton:(UIButton *)sender
{
    NSString *text = self.data[sender.tag];
    [MBHUDHelper showWarningWithText:text delay:1.0];
    NSLog(@"数据源是：%@", text);
    sender.tag ++;
}

- (IBAction)didTapOnLoadingButton:(id)sender
{
    [JPEngine startEngine];
    [MBHUDHelper showWarningWithText:@"正在尝试从Lihux的阿里云服务器请求JS文件"];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://139.129.20.85:4414"]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *script = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if (script) {
            [JPEngine evaluateScript:script];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
