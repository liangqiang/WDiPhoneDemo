//
//  Y012ViewController1.m
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012ViewController1.h"
#import "Y012ViewModel1.h"

@interface Y012ViewController1 ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y012ViewModel1 *viewModel;

@end

@implementation Y012ViewController1

//1、基本表视图(Plain)
-(UITableView*)createPlainTableViewNormal{
    UITableView *tableView = [[UITableView alloc]init];
    tableView.size = CGSizeMake(self.scrollView.width, 300);
    
    //cell重用
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
    return tableView;
}

#pragma mark DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel.personArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.viewModel.personArray safeObjectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel onTableViewSelected:[indexPath row]];
}


@end
