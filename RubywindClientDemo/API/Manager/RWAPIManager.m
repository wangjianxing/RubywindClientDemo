//
//  RWAPIManager.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWAPIManager.h"

@implementation RWAPIManager

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static id sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (void)getTopicIndexRequest:(RWTopicListAPI *)topicIndexApi
                     success:(void (^)(RWTopicListResponseModel *topicListResponseModel))success
                     failure:(void (^)(NSError *error))failure {
    [topicIndexApi requestWithCompletionBlockWithSuccess:^(NSDictionary *responseDictionary) {
        NSError *mtlError;
        RWTopicListResponseModel *topicListResponseModel = [MTLJSONAdapter modelOfClass:RWTopicListResponseModel.class fromJSONDictionary:responseDictionary error:&mtlError];
        success(topicListResponseModel);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getReplyListRequest:(RWReplyListAPI *)replyListApi
                    success:(void (^)(RWReplyListResponseModel *replyListResponseModel))success
                    failure:(void (^)(NSError *error))failure {
    [replyListApi requestWithCompletionBlockWithSuccess:^(NSDictionary *responseDictionary) {
        NSError *mtlError;
        RWReplyListResponseModel *replyListResponseModel = [MTLJSONAdapter modelOfClass:RWReplyListResponseModel.class fromJSONDictionary:responseDictionary error:&mtlError];
        success(replyListResponseModel);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)loginRequest:(RWLoginAPI *)loginApi
             success:(void (^)(RWLoginResponseModel *loginResponseModel))success
             failure:(void (^)(NSError *error))failure {
    [loginApi requestWithCompletionBlockWithSuccess:^(NSDictionary *responseDictionary) {
        NSError *mtlError;
        RWLoginResponseModel *loginResponseModel = [MTLJSONAdapter modelOfClass:RWLoginResponseModel.class fromJSONDictionary:responseDictionary error:&mtlError];
        success(loginResponseModel);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
