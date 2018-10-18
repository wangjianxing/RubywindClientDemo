//
//  UIBarButtonItem+Style.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Style)

+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithButton:(UIButton *)button;

@end
