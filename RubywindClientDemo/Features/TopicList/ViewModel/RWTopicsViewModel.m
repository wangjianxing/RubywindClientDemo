//
//  RWTopicsViewModel.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWTopicsViewModel.h"
#import "RWDefine.h"
#import "RWAPIManager.h"
#import "RWTopicListAPI.h"

@implementation RWTopicsViewModel

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [NSMutableArray array];
    }
    
    return self;
}

- (void)loadData {
    RWTopicListAPI *indexApi = [[RWTopicListAPI alloc] init];
    indexApi.page = @"1";
    
    weakify(self);
    [[RWAPIManager sharedInstance] getTopicIndexRequest:indexApi success:^(RWTopicListResponseModel *topicListResponseModel) {
        strongify(self);
        if (topicListResponseModel.topicList.count > 0) {
            [[self mutableArrayValueForKeyPath:@"dataSource"] addObjectsFromArray:topicListResponseModel.topicList];
        }
    } failure:^(NSError *error) {
        strongify(self);
        self.rwError = error;
    }];
}

- (void)loadUserInfo {
    NSString *userToken = [UserDefaults objectForKey:@"userToken"];
    self.userToken = userToken;
}

- (void)logout {
    [UserDefaults removeObjectForKey:@"userToken"];
    self.userToken = nil;
}

@end
