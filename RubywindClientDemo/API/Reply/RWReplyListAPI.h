//
//  RWReplyListAPI.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWBaseAPI.h"

@interface RWReplyListAPI : RWBaseAPI

@property (nonatomic, copy) NSString *page;
@property (nonatomic, assign) int topicId;

@end
