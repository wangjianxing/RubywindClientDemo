//
//  RWTopicListResponseModel.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWTopicListResponseModel.h"

@implementation RWTopicListResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"topicList": @"topics"
             };
}

+ (NSValueTransformer *)topicListJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:RWTopicModel.class];
}

@end
