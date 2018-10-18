//
//  UIBarButtonItem+Style.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "UIBarButtonItem+Style.h"

@implementation UIBarButtonItem (Style)

+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIBarButtonItem *barButtonItem = nil;
    if ([target respondsToSelector:action] && imageName.length != 0) {
        barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName]
                                                         style:UIBarButtonItemStylePlain
                                                        target:target
                                                        action:action];
    }
    return barButtonItem;
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *barButtonItem = nil;
    if ([target respondsToSelector:action] && title.length != 0) {
        barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title
                                                         style:UIBarButtonItemStylePlain
                                                        target:target
                                                        action:action];
    }
    return barButtonItem;
}

+ (UIBarButtonItem *)barButtonItemWithButton:(UIButton *)button
{
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
