//
//  RWLoginAPI.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWBaseAPI.h"

@interface RWLoginAPI : RWBaseAPI

@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *password;

@end
