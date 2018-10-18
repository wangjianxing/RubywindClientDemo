//
//  RWTopicItemCell.h
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWTopicModel.h"

@interface RWTopicItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) RWTopicModel *topic;

- (void)configureForTopicModel:(RWTopicModel *)topicModel;
@end
