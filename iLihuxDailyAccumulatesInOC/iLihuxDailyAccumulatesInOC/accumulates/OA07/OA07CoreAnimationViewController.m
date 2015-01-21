//
//  OA07CoreAnimationViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/19.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA07CoreAnimationViewController.h"

#import "OA07View.h"

@interface OA07CoreAnimationViewController ()

@property (nonatomic, strong) CALayer *movingLayer;

@property (weak, nonatomic) IBOutlet OA07View *whiteView;

@end

@implementation OA07CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGPoint center = self.whiteView.center;
    center.x = 0;
    self.whiteView.center = center;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hitTestAnimatingLayerTest];
}

- (IBAction)didTapOnBlueButton:(id)sender {
    __block CGPoint center = self.whiteView.center;
    self.whiteView.center = center;
    self.whiteView.backgroundColor = [UIColor clearColor];
    NSLog(@"门西：%@", self.whiteView.layer.presentationLayer);
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        center.x = 300;
        self.whiteView.center = center;
        NSLog(@"门：%@", self.whiteView.layer.presentationLayer);
    } completion:^(BOOL finished) {
    }];
}

- (void)hitTestAnimatingLayerTest
{
    self.movingLayer = [CALayer layer];
    self.movingLayer.bounds = CGRectMake(0, 0, 100, 80);
    self.movingLayer.backgroundColor = [UIColor orangeColor].CGColor;
    self.movingLayer.position = CGPointMake(100, 100);
    [self.movingLayer setPosition:CGPointMake(100, 100)];
    [self.view.layer addSublayer:self.movingLayer];
    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake(110, 130)], [NSValue valueWithCGPoint:CGPointMake(150, 160)], [NSValue valueWithCGPoint:CGPointMake(160, 180)]];
    keyframeAnimation.duration = 10;
    keyframeAnimation.repeatCount = HUGE_VALF;
    keyframeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.movingLayer addAnimation:keyframeAnimation forKey:@"position"];
    
    UITapGestureRecognizer *tapGestureRecoginzer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressLayer:)];
    [self.view addGestureRecognizer:tapGestureRecoginzer];
}

- (IBAction)pressLayer:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint touchPoint = [tapGestureRecognizer locationInView:self.view];
    if ([self.movingLayer.presentationLayer hitTest:touchPoint]) {
        NSLog(@"点中移动的layer");
        [self blinkLayerWithColor:[UIColor greenColor]];
    } else if ([self.movingLayer hitTest:touchPoint]) {
        NSLog(@"点中静止的layer");
        [self blinkLayerWithColor:[UIColor greenColor]];
    }
}

- (void)blinkLayerWithColor:(UIColor *)color
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basicAnimation.duration = 0.1;
    basicAnimation.autoreverses = YES;
    basicAnimation.fromValue = (id)self.movingLayer.backgroundColor;
    basicAnimation.toValue = (id)color.CGColor;
    [self.movingLayer addAnimation:basicAnimation forKey:@"backgroundColor"];
}

- (IBAction)didTapOnWhiteView:(id)sender {
    UITapGestureRecognizer *tapGestureRecognizer = (UITapGestureRecognizer *)sender;
    NSLog(@"点击的位置是：white view 的：%@", NSStringFromCGPoint([tapGestureRecognizer locationInView:tapGestureRecognizer.view]));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
