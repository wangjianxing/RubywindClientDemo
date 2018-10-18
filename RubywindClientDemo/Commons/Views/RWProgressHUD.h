//
//  RWProgressHUD.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWProgressHUD : NSObject

+ (void)show;
+ (void)showWithStatus:(NSString *)string;

+ (void)dismiss;

#pragma mark - toast
+ (void)toastWithMessage:(NSString *)message;

@end
