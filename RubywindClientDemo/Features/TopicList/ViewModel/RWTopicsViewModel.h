//
//  RWTopicsViewModel.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWBaseViewModel.h"

@interface RWTopicsViewModel : RWBaseViewModel

@property (nonatomic, copy) NSString *userToken;
@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)loadData;
- (void)loadUserInfo;
- (void)logout;

@end
