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

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y012_2ViewModel *viewModel;

@end

@implementation Y012_2ViewController

//1、基本表视图(Grouped)
-(UIView*)createGroupedTableViewNormal{
    CGRect frame = CGRectMake(0, 0, self.scrollView.width, 360);
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    
    //cell重用
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
    return tableView;
}

#pragma mark DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.viewModel getSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.viewModel getNumBySection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.viewModel getInfo:[indexPath section] row:[indexPath row]];
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    return 40;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.1;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    CGRect frameRect = CGRectMake(0, 0, 100, 40);
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:frameRect];
//    
//    label.text = [self.viewModel getTitleBySection:section];
//    
//    return label;
//}

//设置分组标题
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.viewModel getTitleBySection:section];
}


#pragma mark Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel onTableViewSelected:[indexPath section] row:[indexPath row]];
}

@end
