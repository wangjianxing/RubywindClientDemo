//
//  RWReplyItemCell.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWReplyItemCell.h"

@implementation RWReplyItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureForReplyModel:(RWReplyModel *)replyModel {
    self.reply = replyModel;
    
    self.bodyLabel.text = self.reply.body;
}

@end
