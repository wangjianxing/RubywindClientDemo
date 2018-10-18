//
//  RWLoginResponseModel.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface RWLoginResponseModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *userToken;
@end
