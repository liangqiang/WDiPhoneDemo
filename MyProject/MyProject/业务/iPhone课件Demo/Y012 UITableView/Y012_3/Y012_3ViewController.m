//
//  Y012ViewController3.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_3ViewController.h"
#import "Y012_3ViewModel.h"
#import "Y012_3TableViewCell.h"
#import "Y012_3PersonItem.h"

@interface Y012_3ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong)Y012_3ViewModel *viewModel;

@end

@implementation Y012_3ViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"自定义表格";
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
    
    [self.tableView registerClass:[Y012_3TableViewCell class] forCellReuseIdentifier:@"cell"];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel getPersonCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Y012_3TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Y012_3PersonItem *personItem = [self.viewModel personAtRow:[indexPath row]];
    cell.nameLabel.text = personItem.name;
    cell.sexLabel.text = personItem.sex;
    cell.picImageView.image = AJIconFontSmile;
    cell.enjoyLabel.text = personItem.enjoy;
    
    return cell;
}

#pragma mark Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}


@end
