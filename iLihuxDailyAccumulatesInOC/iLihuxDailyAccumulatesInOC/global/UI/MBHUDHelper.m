//
//  MBHUDHelper.m
//  iplaza
//
//  Created by Rush.D.Xzj on 4/27/13.
//  Copyright (c) 2013 Wanda Inc. All rights reserved.
//

#import "MBHUDHelper.h"
#import "MBProgressHUD.h"

@implementation MBHUDHelper

+ (void)showWarningWithText:(NSString *)text
{
    [MBHUDHelper showWarningWithText:text delay:2.0f delegate:nil];
}

+ (void)showWarningWithText:(NSString *)text delay:(NSTimeInterval)delay
{
    [MBHUDHelper showWarningWithText:text delay:delay delegate:nil];
}

+ (void)showWarningWithText:(NSString *)text delegate:(id<MBProgressHUDDelegate>)delegate
{
    [MBHUDHelper showWarningWithText:text delay:2.0f delegate:delegate];
}

+ (void)showWarningWithText:(NSString *)text delay:(NSTimeInterval)delay delegate:(id<MBProgressHUDDelegate>)delegate
{
    if (text &&[text isKindOfClass:[NSString class]] &&![text isEqualToString:@""]) {
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        hud.delegate = delegate;
        hud.labelText = text;
        hud.mode = MBProgressHUDModeText;
        hud.dimBackground = NO;
        [hud hide:YES afterDelay:delay];
    }

}
@end
