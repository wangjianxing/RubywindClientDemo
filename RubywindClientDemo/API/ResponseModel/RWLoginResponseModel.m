//
//  RWLoginResponseModel.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWLoginResponseModel.h"

@implementation RWLoginResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userToken": @"token"
             };
}

@end
