//
//  RWTopicIndexAPI.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWTopicListAPI.h"

@implementation RWTopicListAPI

- (NSDictionary *)apiArgument {
    return @{
             @"page": self.page
             };
}

- (NSString *)requestUrl {
    return @"topics";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
