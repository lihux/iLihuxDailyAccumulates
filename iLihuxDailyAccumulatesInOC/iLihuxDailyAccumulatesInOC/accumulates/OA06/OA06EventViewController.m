//
//  OA06EventViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/12.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA06EventViewController.h"

@interface OA06EventViewController ()

@property (weak, nonatomic) IBOutlet UIView *orangeView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation OA06EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self printAllResponders];
}

- (void)printAllResponders
{
    [self printResponder:@"self(UIViewController)" responder:self];
    [self printResponder:@"self.view" responder:self.view];
    [self printResponder:@"self.button" responder:self.button];
    [self printResponder:@"self.label" responder:self.label];
}

- (void)printResponder:(NSString *)info responder: (UIResponder *)responder
{
    NSMutableString *sponderLinks = [NSMutableString new];
    [sponderLinks appendString:@"\n"];
    while (responder) {
        NSString *temp = [self responderNameAndAddress:responder];
        if (!temp) {
            temp = @"";
        }
        [sponderLinks appendString:temp];
        responder = responder.nextResponder;
    }
    NSLog(@"\n现在开始打印%@的响应者链：%@", info, sponderLinks);
    NSLog(@"\n\n");
}

- (NSString *)responderNameAndAddress:(UIResponder *)responder
{
    NSString* nameAndAddress = [[[responder nextResponder] description] componentsSeparatedByString:@";"][0];
    return [nameAndAddress stringByReplacingOccurrencesOfString:@"<" withString:@"\n"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
