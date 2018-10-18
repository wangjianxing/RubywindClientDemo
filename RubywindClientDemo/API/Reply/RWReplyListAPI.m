//
//  RWReplyListAPI.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWReplyListAPI.h"

@implementation RWReplyListAPI

- (NSDictionary *)apiArgument {
    return @{
             @"page": self.page
             };
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"topics/%d/replies", self.topicId];
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
