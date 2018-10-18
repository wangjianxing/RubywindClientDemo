//
//  UIViewController+CustomNavigationItem.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "UIViewController+CustomNavigationItem.h"
#import "UIBarButtonItem+Style.h"

@implementation UIViewController (CustomNavigationItem)

#pragma mark - back button

- (void)addLeftBackButton
{
    [self.navigationItem setHidesBackButton:YES];
    UIBarButtonItem *button = [UIBarButtonItem barButtonItemWithImageName:@"common_back" target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = button;
}

- (void)addLeftBackButtonWithTarget:(id)target action:(SEL)action
{
    [self.navigationItem setHidesBackButton:YES];
    UIBarButtonItem *button = [UIBarButtonItem barButtonItemWithImageName:@"common_back" target:target action:action];
    self.navigationItem.leftBarButtonItem = button;
}

#pragma mark - left button

- (void)addLeftBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *button = [UIBarButtonItem barButtonItemWithTitle:title target:target action:action];
    
    NSDictionary *attrDic = [NSDictionary dictionaryWithObjectsAndKeys:
                             [UIFont systemFontOfSize:15],
                             NSFontAttributeName,
                             nil];
    [button setTitleTextAttributes:attrDic forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = button;
}

- (void)addLeftBarButtonWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIBarButtonItem *button = [UIBarButtonItem barButtonItemWithImageName:imageName target:target action:action];
    self.navigationItem.leftBarButtonItem = button;
}

- (void)addLeftBarButtonItemWithButton:(UIButton *)button
{
    UIBarButtonItem *barButtonItem = [UIBarButtonItem barButtonItemWithButton:button];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)addLeftBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

#pragma mark - right button

- (void)addRightBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *button = [UIBarButtonItem barButtonItemWithTitle:title target:target action:action];
    
    NSDictionary *attrDic = [NSDictionary dictionaryWithObjectsAndKeys:
                             [UIFont systemFontOfSize:15],
                             NSFontAttributeName,
                             nil];
    [button setTitleTextAttributes:attrDic forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = button;
}

- (void)addRightBarButtonWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIBarButtonItem *button = [UIBarButtonItem barButtonItemWithImageName:imageName target:target action:action];
    self.navigationItem.rightBarButtonItem = button;
}

- (void)addRightBarButtonWithButton:(UIButton *)button
{
    UIBarButtonItem *barButtonItem = [UIBarButtonItem barButtonItemWithButton:button];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)addRightBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

#pragma mark - private

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)buttonWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if ([target respondsToSelector:action]) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (imageName.length != 0) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    return button;
}

@end
