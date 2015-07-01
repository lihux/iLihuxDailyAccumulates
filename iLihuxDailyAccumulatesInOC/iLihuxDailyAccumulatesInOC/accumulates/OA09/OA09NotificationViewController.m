//
//  OA09NotificationViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/7/1.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA09NotificationViewController.h"

@interface OA09NotificationViewController () <NSMachPortDelegate>

@property (nonatomic, strong) NSMutableArray *notifications;
@property (nonatomic, strong) NSThread *notificationThread;
@property (nonatomic, strong) NSLock *notificationLock;
@property (nonatomic, strong) NSMachPort *notificaitonPort;

@end

@implementation OA09NotificationViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notifications = [NSMutableArray array];
    self.notificationLock = [[NSLock alloc] init];
    self.notificationThread = [NSThread currentThread];
    self.notificaitonPort = [[NSMachPort alloc] init];
    self.notificaitonPort.delegate = self;
    [[NSRunLoop currentRunLoop] addPort:self.notificaitonPort forMode:NSRunLoopCommonModes];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:@"kOhMyGodNotification" object:nil];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kOhMyGodNotification" object:nil userInfo:nil];
    });
}

#pragma mark - NSMachPortDelegate
- (void)handleMachMessage:(nonnull void *)msg
{
    [self.notificationLock lock];
    while ([self.notifications count]) {
        NSNotification *notification = [self.notifications objectAtIndex:0];
        [self.notifications removeObjectAtIndex:0];
        [self.notificationLock unlock];
        [self processNotification:notification];
        [self.notificationLock lock];
    }
    [self.notificationLock unlock];
}

- (void)processNotification:(NSNotification *)notification
{
    if ([NSThread currentThread] != self.notificationThread) {
        [self.notificationLock lock];
        [self.notifications addObject:notification];
        [self.notificationLock unlock];
        [self.notificaitonPort sendBeforeDate:[NSDate date] components:nil from:nil reserved:0];
    } else {
        NSLog(@"我的老天爷：%@", [NSThread currentThread]);
    }
}

@end
