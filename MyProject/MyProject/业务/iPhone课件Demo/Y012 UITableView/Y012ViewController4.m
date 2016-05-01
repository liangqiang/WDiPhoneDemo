//
//  Y012ViewController4.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012ViewController4.h"
#import "Y012ViewModel4.h"
#import "Y012TableView.h"

@interface Y012ViewController4 ()
@property (nonatomic,strong) Y012ViewModel4 *viewModel;
@property (nonatomic,strong) Y012TableView *tableView;
@end

@implementation Y012ViewController4

-(void)loadView{
    [super loadView];
    
    //createTableView用分类给NSObject添加方法创建表
    self.tableView = [self createTableView];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置弱引用
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
