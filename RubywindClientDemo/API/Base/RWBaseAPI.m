//
//  RWBaseAPI.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWBaseAPI.h"
#import "NSDictionary+JKJSONString.h"
#import "NSString+JKHash.h"
#import "NSString+JKDictionaryValue.h"
#import "RWProgressHUD.h"
#import "RWDefine.h"

NSString * const KMAPIRequestErrorDomain = @"KMAPIRequestErrorDomain";
const NSInteger KMAPIRequestErrorValidateSignFail = 2;
const NSInteger KMAPIRequestErrorFetchDataFail = 3;
const NSInteger KMAPIRequestErrorNoDataFail = 4;

NSString * const RWPIRequestErrorDomain = @"RWAPIRequestErrorDomain";
const NSInteger RWAPIRequestErrorValidateSignFail = 2;
const NSInteger RWAPIRequestErrorFetchDataFail = 3;
const NSInteger RWAPIRequestErrorNoDataFail = 4;

@interface RWBaseAPI()

@end

@implementation RWBaseAPI

- (NSString *)requestUrl {
    return @"/AppService";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestArgument {
    return [self apiArgument];
}

- (void)requestWithCompletionBlockWithSuccess:(void (^)(NSDictionary *responseDictionary))success
                                      failure:(void (^)(NSError *error))failure {
    [RWProgressHUD show];
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        [RWProgressHUD dismiss];
        NSError *error;
        NSDictionary *responseObject = (NSDictionary *)request.responseObject;
        if (error) {
            failure(error);
        } else {
            success(responseObject);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [RWProgressHUD dismiss];
        failure(request.error);
    }];
}

#pragma mark - Subclass Override

- (NSDictionary *)apiArgument {
    return nil;
}

- (NSString *)apiCommand {
    return nil;
}

@end
