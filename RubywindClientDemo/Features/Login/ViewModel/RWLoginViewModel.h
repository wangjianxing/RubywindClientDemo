//
//  RWLoginViewModel.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWBaseViewModel.h"

@interface RWLoginViewModel : RWBaseViewModel

@property (nonatomic, copy) NSString *userToken;

- (void)loginWithEmail:(NSString *)email password:(NSString *)password;

@end
