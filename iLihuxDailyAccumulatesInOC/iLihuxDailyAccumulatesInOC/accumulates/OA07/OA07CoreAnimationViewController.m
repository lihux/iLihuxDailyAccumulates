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

@end

@implementation OA07CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customUI];
}

- (void)customUI
{
    self.movingLayer = [CALayer layer];
    UIImage *image = [UIImage imageNamed:@"qq"];
    self.movingLayer.contents = (__bridge id)(image.CGImage);
    self.movingLayer.position = CGPointMake(100, 200);
    self.movingLayer.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    self.movingLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:self.movingLayer];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self multiAnimationTest2];
}

- (void)multiAnimationTest1
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    CGFloat currentX = self.movingLayer.position.x;
    CGFloat targetX = currentX + 150;
    animation.fromValue = [NSNumber numberWithFloat:currentX];
    animation.toValue = [NSNumber numberWithFloat:(targetX)];
    animation.duration = 2.0;
    animation.additive = YES;
    [self.movingLayer addAnimation:animation forKey:@"position.x"];
    self.movingLayer.position = CGPointMake(targetX, self.movingLayer.position.y);
}

- (void) multiAnimationTest2
{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 30, 30)];
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 200, 200)];
    CAShapeLayer *roundLayer = [CAShapeLayer layer];
    roundLayer.path = rectPath.CGPath;
    roundLayer.strokeColor = [UIColor whiteColor].CGColor;
    roundLayer.lineDashPattern = @[@3, @3];
    roundLayer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer insertSublayer:roundLayer below:self.movingLayer];

    CAKeyframeAnimation *rectAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    rectAnimation.path = rectPath.CGPath;
    rectAnimation.duration = 10;
    rectAnimation.repeatCount = HUGE;
    rectAnimation.calculationMode = kCAAnimationPaced;
    
    CAKeyframeAnimation *circleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    circleAnimation.path = circlePath.CGPath;
    circleAnimation.duration = 1;
    circleAnimation.repeatCount = HUGE;
    circleAnimation.additive = YES;
    circleAnimation.calculationMode = kCAAnimationPaced;
    
    [self.movingLayer addAnimation:rectAnimation forKey:@"follow a rect shape"];
    [self.movingLayer addAnimation:circleAnimation forKey:@"loop around"];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
