//
//  RWReplyItemCell.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWReplyModel.h"

@interface RWReplyItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (nonatomic, strong) RWReplyModel *reply;

- (void)configureForReplyModel:(RWReplyModel *)replyModel;
@end
