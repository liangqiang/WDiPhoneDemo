//
//  IphoneDemoListViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "IphoneDemoListViewController.h"
#import "IphoneDemoListTableView.h"
#import "IphoneDemoListModel.h"

@interface IphoneDemoListViewController ()
@property (nonatomic,strong) IphoneDemoListModel *viewModel;
@property (nonatomic,strong) IphoneDemoListTableView *tableView;
@end

@implementation IphoneDemoListViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"Iphone课件Demo";
    }
    return self;
}

-(void)loadView{
    [super loadView];
    
    self.tableView = [self createTableView];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    self.tableView.sectionArray = self.viewModel.sectionArray;
    [self.tableView setRefreshHeaderBlock:^{
        [weakSelf.viewModel loadData];
    }];
    [self.tableView setRefreshFooterBlock:^{
        [weakSelf.viewModel loadData];
    }];
    [self.tableView setClickBlock:^(NSIndexPath *indexPath) {
        [weakSelf.viewModel onCellClicked:indexPath];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.tableView stopRefresh];
    [self.tableView reloadData];
}

@end
