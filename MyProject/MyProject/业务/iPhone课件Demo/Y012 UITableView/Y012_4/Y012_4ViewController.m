//
//  Y012ViewController4.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_4ViewController.h"
#import "Y012_4ViewModel.h"
#import "Y012_4TableView.h"

@interface Y012_4ViewController ()
@property (nonatomic,strong) Y012_4ViewModel *viewModel;
@property (nonatomic,strong) Y012_4TableView *tableView;
@end

@implementation Y012_4ViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"自定义表格(框架)";
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
