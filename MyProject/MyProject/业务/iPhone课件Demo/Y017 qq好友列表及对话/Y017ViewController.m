//
//  Y017ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/12.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017ViewController.h"
#import "Y017ViewModel.h"
#import "Y017TableViewCell.h"
#import "Y017SectionView.h"

@interface Y017ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) Y017ViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation Y017ViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"好友列表";
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
    
    [self.tableView registerClass:[Y017TableViewCell class] forCellReuseIdentifier:@"cell"];
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
    [self.tableView stopRefresh];
    [self.tableView reloadData];
}


#pragma mark DataSource Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.viewModel sectionCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel friendCountAtSection:section];
}

- (Y017TableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Y017TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell updateItem:[self.viewModel friendAtSection:[indexPath section] row:[indexPath row]]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.viewModel isOpenAtSection:[indexPath section]]){
        return 44;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    Y017SectionView *header = [[Y017SectionView alloc] initWithTag:section andImage:[self.viewModel imageSection:section] andTitle:[self.viewModel titleSection:section]];
    
    UITapGestureRecognizer *sing = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingTap:)];
    sing.numberOfTapsRequired = 1;
    sing.numberOfTouchesRequired = 1;
    [header addGestureRecognizer:sing];
    return header;
}

-(void)SingTap:(UITapGestureRecognizer*)rec{
    [self.viewModel changeShowDic:rec.view.tag];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:rec.view.tag] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel onItemClicked:indexPath];
}

@end
