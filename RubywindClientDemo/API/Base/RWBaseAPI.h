//
//  RWBaseAPI.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "YTKRequest.h"

@interface RWBaseAPI : YTKRequest

@property (nonatomic, copy) NSDictionary *apiArgument;

- (void)startWithCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success
                                    failure:(YTKRequestCompletionBlock)failure __attribute__((deprecated("请使用requestWithCompletionBlockWithSuccess")));

- (void)requestWithCompletionBlockWithSuccess:(void (^)(NSDictionary *responseDictionary))success
                                      failure:(void (^)(NSError *error))failure;

@end
