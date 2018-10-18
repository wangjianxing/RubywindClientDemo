//
//  RWTopicDetailViewModel.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWBaseViewModel.h"
#import "RWTopicModel.h"

@interface RWTopicDetailViewModel : RWBaseViewModel

@property (nonatomic, strong) RWTopicModel *topic;
@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)loadData;

@end
