//
//  RWTopicDetailViewModel.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWTopicDetailViewModel.h"
#import "RWDefine.h"
#import "RWAPIManager.h"
#import "RWReplyListAPI.h"

@implementation RWTopicDetailViewModel

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [NSMutableArray array];
    }
    
    return self;
}

- (void)loadData {
    RWReplyListAPI *listApi = [[RWReplyListAPI alloc] init];
    listApi.page = @"1";
    listApi.topicId = self.topic.topicId;

    weakify(self);
    [[RWAPIManager sharedInstance] getReplyListRequest:listApi success:^(RWReplyListResponseModel *replyListResponseModel) {
        strongify(self);
        if (replyListResponseModel.replyList.count > 0) {
            [[self mutableArrayValueForKeyPath:@"dataSource"] addObjectsFromArray:replyListResponseModel.replyList];
        }
    } failure:^(NSError *error) {
        strongify(self);
        self.rwError = error;
    }];
}

@end
