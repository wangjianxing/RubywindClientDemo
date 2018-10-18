//
//  RWTopicModel.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWTopicModel.h"

@implementation RWTopicModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"topicId": @"id",
             @"title": @"title",
             @"body": @"body"
             };
}

@end
