//
//  Y012ViewController1.m
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_1ViewController.h"
#import "Y012_1ViewModel.h"

@interface Y012_1ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) Y012_1ViewModel *viewModel;

@end

@implementation Y012_1ViewController

//1、基本表视图(Plain)
-(UITableView*)createPlainTableViewNormal{
    UITableView *tableView = [UITableView new];
    tableView.size = CGSizeMake(self.scrollView.width, 300);
    
    //cell重用
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
    return tableView;
}

#pragma mark DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel getCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.viewModel getInfo:[indexPath row]];
    
    return cell;
}

#pragma mark Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel onTableViewSelected:[indexPath row]];
}


@end
