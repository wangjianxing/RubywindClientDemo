//
//  RWLoginAPI.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWLoginAPI.h"

@implementation RWLoginAPI

- (NSDictionary *)apiArgument {
    return @{ @"user":
            @{ @"email": self.email,
               @"password": self.password
             }
              };
}

- (NSString *)requestUrl {
    return @"users/sign_in";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
