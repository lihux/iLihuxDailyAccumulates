//
//  OA13AsyncDemoViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA13AsyncDemoViewController.h"

#import "OA13Demo1ViewController.h"
#import "OA13Demo2ViewController.h"
#import "OA13Demo3ViewController.h"

@interface OA13AsyncDemoViewController ()

@property (nonatomic, strong) NSArray *demoStoryboardIDs;

@end

@implementation OA13AsyncDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.demoStoryboardIDs = @[@"OA13Demo1ViewController", @"OA13Demo2ViewController", @"OA13Demo3ViewController"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didTapOnButton:(UIButton *)sender
{
    NSAssert(sender.tag < self.demoStoryboardIDs.count, @"button tag out of range");
    UIViewController *demoViewController = [[UIStoryboard storyboardWithName:@"OA13" bundle:nil] instantiateViewControllerWithIdentifier:self.demoStoryboardIDs[sender.tag]];
    sender.enabled = NO;
    [self.navigationController pushViewController:demoViewController animated:YES];
    sender.enabled = YES;
}

@end
