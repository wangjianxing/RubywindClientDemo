//
//  UIViewController+CustomNavigationItem.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CustomNavigationItem)

#pragma mark - back button

- (void)addLeftBackButton;
- (void)addLeftBackButtonWithTarget:(id)target action:(SEL)action;

#pragma mark - left button

- (void)addLeftBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (void)addLeftBarButtonWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;
- (void)addLeftBarButtonItemWithButton:(UIButton *)button;
- (void)addLeftBarButtonItem:(UIBarButtonItem *)barButtonItem;

#pragma mark - right button

- (void)addRightBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (void)addRightBarButtonWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;
- (void)addRightBarButtonWithButton:(UIButton *)button;
- (void)addRightBarButtonItem:(UIBarButtonItem *)barButtonItem;

@end
