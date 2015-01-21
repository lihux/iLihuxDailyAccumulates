//
//  OA06EventViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/12.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA06EventViewController.h"

#import "OA06ChildViewViewController.h"

@interface OA06EventViewController ()

@property (weak, nonatomic) IBOutlet UIView *orangeView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *childControllerView;
@property (nonatomic, strong) OA06ChildViewViewController *childController;

@end

@implementation OA06EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.childController = (OA06ChildViewViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"childviewcontroller"];
//    [self addChildViewController:self.childController];
//    [self.orangeView addSubview:self.childController.view];
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
    [self printResponder:@"child controller view:" responder:self.childController.view];
    NSLog(@"\n\n孩儿他爹：%@", self.childController);
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
            NSLog(@"看看吧：%@,前黄后绿 %@", self.yellowView, self.greenView);
            self.button.tag = 3;
        }];
    } else if (self.button.tag == 3) {
        self.button.tag = 4;
        UIView *yellowView = self.yellowView;
        NSLog(@"\n改变黄色view的transform之前：\nframe = %@bounds = %@center = %f, %f\n", [self printFrame:yellowView.frame], [self printFrame:yellowView.bounds], yellowView.center.x, yellowView.center.y);
        [UIView animateWithDuration:1 animations:^{
            yellowView.transform = CGAffineTransformMakeRotation(0.5);
        } completion:^(BOOL finished) {
            NSLog(@"\n改变黄色view的transform之后：\nframe = %@bounds = %@center = %f, %f\n", [self printFrame:yellowView.frame], [self printFrame:yellowView.bounds], yellowView.center.x, yellowView.center.y);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                yellowView.clipsToBounds = YES;
                yellowView.backgroundColor = [UIColor clearColor];
                NSLog(@"看看黄view的alpha = %f", yellowView.alpha);
            });
        }];
    }
}

- (NSString *)printFrame:(CGRect)frame
{
    return [NSString stringWithFormat:@"x=%f, y=%f, width=%f, height=%f\n", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height];
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
