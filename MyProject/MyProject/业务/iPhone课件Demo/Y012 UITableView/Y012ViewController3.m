//
//  Y012ViewController3.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012ViewController3.h"
#import "Y012ViewModel3.h"
#import "Y012TableViewCell.h"
#import "Y012CustomObject.h"

@interface Y012ViewController3 ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y012ViewModel3 *viewModel;

@end

@implementation Y012ViewController3


//1、表视图(自定义cell内容)
-(UITableView*)createCustomTableViewNormal{
    UITableView *tableView = [UITableView new];
    tableView.size = CGSizeMake(self.scrollView.width, 300);
    
    //cell重用
    [tableView registerClass:[Y012TableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
    return tableView;
}

#pragma mark DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel getPersonCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Y012TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    Y012CustomObject *object = [self.viewModel getObjectByRow:[indexPath row]];
    cell.nameLabel.text = object.name;
    cell.sexLabel.text = object.sex;
    cell.picImageView.image = AJIconFontSmile;
    cell.enjoyLabel.text = object.enjoy;
    
    
    return cell;
}

#pragma mark Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}


@end
