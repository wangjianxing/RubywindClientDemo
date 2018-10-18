//
//  RWReplyModel.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface RWReplyModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) int replyId;
@property (nonatomic, copy) NSString *body;

@end
