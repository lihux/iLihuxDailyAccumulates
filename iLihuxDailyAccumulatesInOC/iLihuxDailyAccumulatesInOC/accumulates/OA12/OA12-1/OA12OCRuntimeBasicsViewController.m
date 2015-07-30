//
//  OA12OCRuntimeBasicsViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/30.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA12OCRuntimeBasicsViewController.h"

#import <objc/runtime.h>

@interface OA12OCRuntimeBasicsViewController ()

@end

@implementation OA12OCRuntimeBasicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)changeTheWorld
{
    NSLog(@"饭馊了，不能吃了");
}

- (IBAction)didTapOnButton:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    NSArray *methods = @[@"stringChangeToMethod", @"exchangeMethods", @"createNewClassRuntime", @"stringChangeToMethod", @"stringChangeToMethod"];
    NSString * method = methods[tag];
    SEL selector = NSSelectorFromString(method);
    IMP imp = [self methodForSelector:selector];
    void (*func)(id, SEL) = (void *)imp;
    func(self, selector);
}

//1.通过string 获取 类方法的调用
- (void)stringChangeToMethod
{
    NSLog(@"write the code, change the world");
    SEL selector = NSSelectorFromString(@"wopei");
    IMP imp = [self methodForSelector:selector];
    void (*func)(id, SEL) = (void *)imp;
    func(self, selector);
}

//2.替换某个类的方法为新的实现：
- (void)exchangeMethods
{
    class_replaceMethod([self class], @selector(wopei), [self methodForSelector:@selector(wopei)], "");
    [self wopei];
}

//3.runtime新注册一个类，并为其添加一个方法：
- (void)createNewClassRuntime
{
    if (!objc_getClass("Lihux")) {
        Class Lihux = objc_allocateClassPair([NSObject class], "Lihux", 0);
        class_addMethod([Lihux class], @selector(wopei), [self methodForSelector:@selector(wopei)], "");
        objc_registerClassPair([Lihux class]);
    }
    id alihux = [NSClassFromString(@"Lihux") new];
    [alihux wopei];
}

- (void)haha
{
    class_replaceMethod([self class], @selector(wopei), [self methodForSelector:@selector(hello)], "");
    [self wopei];
}

- (void)wopei
{
    NSLog(@"从前有座山，山上有座庙，庙里有个老和尚");
}

- (void)hello
{
    NSLog(@"细心观战，好好反思");
}

@end
