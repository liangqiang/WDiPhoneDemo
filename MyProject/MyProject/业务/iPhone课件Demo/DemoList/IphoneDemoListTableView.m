//
//  IphoneDemoListTableView.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "IphoneDemoListTableView.h"

@implementation IphoneDemoListTableView

#pragma mark - 设置cell类
-(NSString*)cellIdentifier:(NSIndexPath*)indexPath{
    return @"Cell";
}

-(void)registerCellClasses{
    [self registerClass:NSClassFromString(@"IphoneDemoListTableViewCell") forCellReuseIdentifier:@"Cell"];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

@end
