//
//  IphoneDemoListViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y000ViewController.h"
#import "Y000TableView.h"
#import "Y000ViewModel.h"

@interface Y000ViewController ()
@property (nonatomic,strong) Y000ViewModel *viewModel;
@property (nonatomic,strong) Y000TableView *tableView;
@end

@implementation Y000ViewController

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
