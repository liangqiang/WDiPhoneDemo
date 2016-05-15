//
//  Y017_1ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/12.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017_1ViewController.h"
#import "Y017_1TableViewCell.h"
#import "Y017_1ViewModel.h"

@interface Y017_1ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) Y017_1ViewModel *viewModel;
@end

@implementation Y017_1ViewController

-(void)loadView{
    [super loadView];
    
    self.tableView = [self createTableView];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[Y017_1TableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.tableView stopRefresh];
    [self.tableView reloadData];
}

#pragma mark - tableView的数据源和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel cellCount];
}

- (Y017_1TableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Y017_1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell cellFrameRow:[self.viewModel cellFrameModelAtRow:[indexPath row]]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.viewModel cellHeightAtRow:[indexPath row]];
}

@end
