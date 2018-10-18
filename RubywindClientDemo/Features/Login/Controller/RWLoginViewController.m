//
//  RWLoginViewController.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWLoginViewController.h"
#import "RWLoginViewModel.h"
#import "RWDefine.h"

#import <KVOController/KVOController.h>

@interface RWLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (nonatomic, strong) RWLoginViewModel *viewModel;
@end

@implementation RWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupObservers];
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (IBAction)userLogin:(id)sender {
    [self.viewModel loginWithEmail:self.emailField.text password:self.passwordField.text];
}

#pragma mark - private
- (void)initView {
    self.title = @"Login";
}

- (void)setupObservers {
    self.viewModel = [[RWLoginViewModel alloc] init];
    
    [self.KVOController observe:self.viewModel keyPath:@"rwError" options:NSKeyValueObservingOptionNew block:^(RWLoginViewController *observer, RWLoginViewModel *object, NSDictionary *change) {
        ALERT(object.rwError.localizedDescription , object.rwError.localizedFailureReason);
    }];
    
    weakify(self);
    [self.KVOController observe:self.viewModel keyPath:@"userToken" options:NSKeyValueObservingOptionNew block:^(RWLoginViewController *observer, RWLoginViewModel *object, NSDictionary *change) {
        strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

@end
