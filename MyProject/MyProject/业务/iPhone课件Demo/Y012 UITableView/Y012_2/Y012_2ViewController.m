//
//  Y012ViewController2.m
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_2ViewController.h"
#import "Y012_2ViewModel.h"

@interface Y012_2ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) Y012_2ViewModel *viewModel;

@end

@implementation Y012_2ViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"分组表格";
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
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
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
    [self.tableView reloadData];
}

#pragma mark DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.viewModel regionCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.viewModel cityCountAtSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.viewModel cityNameAtSection:[indexPath section] row:[indexPath row]];
    
    return cell;
}

//设置分组标题
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.viewModel regionNameAtSection:section];
}


#pragma mark Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel onTableViewSelected:[indexPath section] row:[indexPath row]];
}

@end
