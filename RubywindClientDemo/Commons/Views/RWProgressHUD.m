//
//  RWProgressHUD.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWProgressHUD.h"

#import <UIKit/UIKit.h>
#import <JGProgressHUD/JGProgressHUD.h>

static JGProgressHUD *hud = nil;

@implementation RWProgressHUD

+ (void)show {
    [self showWithStatus:@""];
}

+ (void)showWithStatus:(NSString *)string {
    if (hud == nil) {
        hud = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    }
    
    if (hud) {
        if (string && string.length > 0) {
            hud.textLabel.text = string;
        }
        
        [hud showInView:[self appWindow] animated:YES];
    }
}

+ (void)dismiss {
    if (hud) {
        [hud dismissAnimated:YES];
    }
}

+ (void)toastWithMessage:(NSString *)message {
    JGProgressHUD *toastHud = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    toastHud.indicatorView = nil;
    toastHud.textLabel.text = message;
    [toastHud showInView:[self appWindow] animated:YES];
    [toastHud dismissAfterDelay:2.0 animated:YES];
}

#pragma mark - private
+ (UIWindow *)appWindow
{
    return [[UIApplication sharedApplication].delegate window];
}

@end
