//
//  RWTopicDetailViewController.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWTopicDetailViewController.h"
#import "RWReplyItemCell.h"
#import "RWTopicDetailViewModel.h"
#import "RWReplyModel.h"

#import <KVOController/KVOController.h>
#import "RWDefine.h"

static NSString *ReplyItemIdentifier = @"ReplyItemIdentifier";

@interface RWTopicDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RWTopicDetailViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UILabel *topicAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *topicTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *topicBodyLabel;
@property (weak, nonatomic) IBOutlet UITableView *repliesTableView;
@end

@implementation RWTopicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupObservers];
    
    self.repliesTableView.dataSource = self;
    self.repliesTableView.delegate = self;
    [self.repliesTableView registerNib:[UINib nibWithNibName:@"RWReplyItemCell" bundle:nil] forCellReuseIdentifier:ReplyItemIdentifier];
    [self.repliesTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self initView];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - replies tableview
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    RWReplyItemCell *cell = [tableView dequeueReusableCellWithIdentifier:ReplyItemIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[RWReplyItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReplyItemIdentifier];
    }
    RWReplyModel *reply = (RWReplyModel *)self.viewModel.dataSource[indexPath.row];
    [cell configureForReplyModel:reply];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    
//    XLog_INFO(@"Indexpath = %@", indexPath);
}

#pragma mark - private
- (void)initView {
//    self.topicAuthorLabel
    self.topicTitleLabel.text = self.topic.title;
    self.topicBodyLabel.text = self.topic.body;
    self.title = self.topic.title;
}

- (void)initData {
    self.viewModel.topic = self.topic;
    [self.viewModel loadData];
}

- (void)setupObservers {
    self.viewModel = [[RWTopicDetailViewModel alloc] init];
    
    [self.KVOController observe:self.viewModel keyPath:@"rwError" options:NSKeyValueObservingOptionNew block:^(RWTopicDetailViewController *observer, RWTopicDetailViewModel *object, NSDictionary *change) {
        ALERT(object.rwError.localizedDescription , object.rwError.localizedFailureReason);
    }];
    
    [self.KVOController observe:self.viewModel keyPath:@"dataSource" options:NSKeyValueObservingOptionNew block:^(RWTopicDetailViewController *observer, RWTopicDetailViewModel *object, NSDictionary *change) {
        [observer.repliesTableView reloadData];
    }];
}

@end
