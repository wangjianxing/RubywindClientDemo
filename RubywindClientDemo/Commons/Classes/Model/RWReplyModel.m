//
//  RWReplyModel.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWReplyModel.h"

@implementation RWReplyModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"replyId": @"id",
             @"body": @"body"
             };
}

@end
