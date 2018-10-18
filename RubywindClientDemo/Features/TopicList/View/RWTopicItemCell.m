//
//  RWTopicItemCell.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWTopicItemCell.h"

@implementation RWTopicItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureForTopicModel:(RWTopicModel *)topicModel {
    self.topic = topicModel;
    
//    self.userNameLabel.text =
    self.titleLabel.text = self.topic.title;
}

@end
