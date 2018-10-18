//
//  RWTopicModel.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface RWTopicModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) int topicId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;

@end
