//
//  RWLoginViewModel.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWLoginViewModel.h"
#import "RWDefine.h"
#import "RWAPIManager.h"
#import "RWLoginAPI.h"

@implementation RWLoginViewModel

- (void)loginWithEmail:(NSString *)email password:(NSString *)password {
    RWLoginAPI *loginApi = [[RWLoginAPI alloc] init];
    loginApi.email = email;
    loginApi.password = password;
    
    weakify(self);
    [[RWAPIManager sharedInstance] loginRequest:loginApi success:^(RWLoginResponseModel *loginResponseModel) {
        strongify(self);
        if (loginResponseModel.userToken) {
            self.userToken = loginResponseModel.userToken;
            [UserDefaults setObject:self.userToken forKey:@"userToken"];
        }
    } failure:^(NSError *error) {
        strongify(self);
        self.rwError = error;
    }];
    
}

@end
