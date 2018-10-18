//
//  RWReplyListResponseModel.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWReplyListResponseModel.h"

@implementation RWReplyListResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"replyList": @"replies"
             };
}

+ (NSValueTransformer *)replyListJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:RWReplyModel.class];
}

@end
