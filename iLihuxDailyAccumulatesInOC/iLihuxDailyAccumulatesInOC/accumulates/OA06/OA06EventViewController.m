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
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *yellowView;

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

- (IBAction)didTapOnButton:(id)sender
{
    if (self.button.tag == 0) {
        self.greenView = [[UIView alloc] initWithFrame:CGRectMake(30, 90, 200, 200)];
        self.yellowView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
        self.greenView.backgroundColor = [UIColor greenColor];
        self.yellowView.backgroundColor = [UIColor yellowColor];
        [self.greenView addSubview:self.yellowView];
        [self.view addSubview:self.greenView];
        self.button.tag = 1;
    } else if (self.button.tag == 1) {
        [UIView animateWithDuration:0.8 animations:^{
            CGRect bounds = self.yellowView.bounds;
            bounds.size.width = bounds.size.width / 2;
            self.yellowView.bounds = bounds;
        } completion:^(BOOL finished) {
            NSLog(@"看看吧：%@", self.yellowView);
            self.button.tag = 2;
        }];
    } else if (self.button.tag == 2) {
        [UIView animateWithDuration:0.8 animations:^{
            CGRect bounds = self.greenView.bounds;
            bounds.origin.x = 20;
            bounds.origin.y = -20;
            self.greenView.bounds = bounds;
        } completion:^(BOOL finished) {
            NSLog(@"看看吧：%@,dlkdkldssd %@", self.yellowView, self.greenView);
        }];
    }
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
