//
//  RWTopicListResponseModel.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "RWTopicModel.h"

@interface RWTopicListResponseModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSArray *topicList;

@end
