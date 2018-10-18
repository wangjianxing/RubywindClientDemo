//
//  ViewController.m
//  RubywindClientDemo
//
//  Created by wangjianxing on 2018/10/18.
//  Copyright © 2018年 wangjianxing. All rights reserved.
//

#import "RWTopicsViewController.h"
#import <KVOController/KVOController.h>
#import "RWTopicsViewModel.h"
#import "RWTopicItemCell.h"
#import "RWDefine.h"

#import "RWTopicDetailViewController.h"
#import "RWLoginViewController.h"
#import "UIViewController+CustomNavigationItem.h"

static NSString *TopicItemIdentifier = @"TopicItemIdentifier";

@interface RWTopicsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) RWTopicsViewModel *viewModel;
@end

@implementation RWTopicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupObservers];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"RWTopicItemCell" bundle:nil] forCellReuseIdentifier:TopicItemIdentifier];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    self.tableView.backgroundColor = COLOR_OF_BACKGROUND;
    
    [self initView];
    [self initData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.viewModel loadUserInfo];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    RWTopicItemCell *cell = [tableView dequeueReusableCellWithIdentifier:TopicItemIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[RWTopicItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TopicItemIdentifier];
    }
    RWTopicModel *topic = (RWTopicModel *)self.viewModel.dataSource[indexPath.row];
    [cell configureForTopicModel:topic];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *theStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RWTopicDetailViewController *vc = [theStoryboard instantiateViewControllerWithIdentifier:@"RWTopicDetailVC"];
    vc.topic = self.viewModel.dataSource[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
    XLog_INFO(@"Indexpath = %@", indexPath);
}


#pragma mark - private
- (void)initView {
}

- (void)initData {
    [self.viewModel loadData];
}

- (void)setupObservers {
    self.viewModel = [[RWTopicsViewModel alloc] init];
    
    [self.KVOController observe:self.viewModel keyPath:@"rwError" options:NSKeyValueObservingOptionNew block:^(RWTopicsViewController *observer, RWTopicsViewModel *object, NSDictionary *change) {
        ALERT(object.rwError.localizedDescription , object.rwError.localizedFailureReason);
    }];
    
    [self.KVOController observe:self.viewModel keyPath:@"dataSource" options:NSKeyValueObservingOptionNew block:^(RWTopicsViewController *observer, RWTopicsViewModel *object, NSDictionary *change) {
        [observer.tableView reloadData];
    }];
    
    weakify(self);
    [self.KVOController observe:self.viewModel keyPath:@"userToken" options:NSKeyValueObservingOptionNew block:^(RWTopicsViewController *observer, RWTopicsViewModel *object, NSDictionary *change) {
        strongify(self);
        [self initUserView];
    }];
}

- (void)initUserView {
    if (self.viewModel.userToken) {
        [self addLeftBarButtonWithTitle:@"Logout" target:self action:@selector(goLogout)];
    } else {
        [self addLeftBarButtonWithTitle:@"Login" target:self action:@selector(goLogin)];
    }
}

#pragma mark - selector
- (void)goLogin {
    UIStoryboard *theStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RWLoginViewController *vc = [theStoryboard instantiateViewControllerWithIdentifier:@"RWLoginVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)goLogout {
    [self.viewModel logout];
}

@end
