//
//  RWAPIManager.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTopicListResponseModel.h"
#import "RWReplyListResponseModel.h"
#import "RWLoginResponseModel.h"
#import "RWTopicListAPI.h"
#import "RWReplyListAPI.h"
#import "RWLoginAPI.h"

@interface RWAPIManager : NSObject

+ (instancetype)sharedInstance;

- (void)getTopicIndexRequest:(RWTopicListAPI *)topicIndexApi
                     success:(void (^)(RWTopicListResponseModel *topicListResponseModel))success
                     failure:(void (^)(NSError *error))failure;

- (void)getReplyListRequest:(RWReplyListAPI *)replyListApi
                     success:(void (^)(RWReplyListResponseModel *replyListResponseModel))success
                     failure:(void (^)(NSError *error))failure;

- (void)loginRequest:(RWLoginAPI *)loginApi
                    success:(void (^)(RWLoginResponseModel *loginResponseModel))success
                    failure:(void (^)(NSError *error))failure;

@end
