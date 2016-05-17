//
//  Y019ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y019ViewController.h"
#import "Y019ViewModel.h"

@interface Y019ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) Y019ViewModel *viewModel;
@end

@implementation Y019ViewController

//plist
-(UIButton*)createPlistWrite{
    WEAKSELF
    return [self createButtonWithTitle:@"plist数据写入" block:^(UIControl *control) {
        [weakSelf.viewModel createPlistWrite];
    }];
}
-(UIButton*)createPlistRead{
    WEAKSELF
    return [self createButtonWithTitle:@"plist数据读取" block:^(UIControl *control) {
        [weakSelf.viewModel createPlistRead];
    }];
}

//keychain
-(UIButton*)createKeychainWrite{
    WEAKSELF
    return [self createButtonWithTitle:@"keychain数据写入" block:^(UIControl *control) {
        [weakSelf.viewModel createKeychainWrite];
    }];
}
-(UIButton*)createKeychainRead{
    WEAKSELF
    return [self createButtonWithTitle:@"keychain数据读取" block:^(UIControl *control) {
        [weakSelf.viewModel createPlistRead];
    }];
}
-(UIButton*)createKeychainDelete{
    WEAKSELF
    return [self createButtonWithTitle:@"keychain数据删除" block:^(UIControl *control) {
        [weakSelf.viewModel createKeychainDelete];
    }];
}

//UserDefalut
-(UIButton*)createUserDefaultWrite{
    WEAKSELF
    return [self createButtonWithTitle:@"UserDefault数据写入" block:^(UIControl *control) {
        [weakSelf.viewModel createUserDefaultWrite];
    }];
}
-(UIButton*)createUserDefaultRead{
    WEAKSELF
    return [self createButtonWithTitle:@"UserDefault数据读取" block:^(UIControl *control) {
        [weakSelf.viewModel createUserDefaultRead];
    }];
}

//sqlite3
-(UIButton*)createSqlite3DB{
    WEAKSELF
    return [self createButtonWithTitle:@"Sqlite3数据库创建" block:^(UIControl *control) {
        [weakSelf.viewModel createSqlite3DB];
    }];
}
-(UIButton*)createSqlite3Table{
    WEAKSELF
    return [self createButtonWithTitle:@"Sqlite3数据表创建" block:^(UIControl *control) {
        [weakSelf.viewModel createSqlite3Table];
    }];
}
-(UIButton*)createSqlite3Insert{
    WEAKSELF
    return [self createButtonWithTitle:@"Sqlite3数据写入" block:^(UIControl *control) {
        [weakSelf.viewModel createSqlite3Insert];
    }];
}
-(UIButton*)createSqlite3Select{
    WEAKSELF
    return [self createButtonWithTitle:@"Sqlite3数据查询" block:^(UIControl *control) {
        [weakSelf.viewModel createSqlite3Select];
    }];
}
-(UIButton*)createSqlite3Update{
    WEAKSELF
    return [self createButtonWithTitle:@"Sqlite3数据修改" block:^(UIControl *control) {
        [weakSelf.viewModel createSqlite3Update];
    }];
}
-(UIButton*)createSqlite3Delete{
    WEAKSELF
    return [self createButtonWithTitle:@"Sqlite3数据删除" block:^(UIControl *control) {
        [weakSelf.viewModel createSqlite3Delete];
    }];
}

//FMDB
-(UIButton*)createFMDBDB{
    WEAKSELF
    return [self createButtonWithTitle:@"FMDB数据库创建" block:^(UIControl *control) {
        [weakSelf.viewModel createFMDBDB];
    }];
}
-(UIButton*)createFMDBTable{
    WEAKSELF
    return [self createButtonWithTitle:@"FMDB数据表创建" block:^(UIControl *control) {
        [weakSelf.viewModel createFMDBTable];
    }];
}
-(UIButton*)createFMDBInsert{
    WEAKSELF
    return [self createButtonWithTitle:@"FMDB数据写入" block:^(UIControl *control) {
        [weakSelf.viewModel createFMDBInsert];
    }];
}
-(UIButton*)createFMDBSelect{
    WEAKSELF
    return [self createButtonWithTitle:@"FMDB数据查询" block:^(UIControl *control) {
        [weakSelf.viewModel createFMDBSelect];
    }];
}
-(UIButton*)createFMDBUpdate{
    WEAKSELF
    return [self createButtonWithTitle:@"FMDB数据修改" block:^(UIControl *control) {
        [weakSelf.viewModel createFMDBUpdate];
    }];
}
-(UIButton*)createFMDBDelete{
    WEAKSELF
    return [self createButtonWithTitle:@"FMDB数据删除" block:^(UIControl *control) {
        [weakSelf.viewModel createFMDBDelete];
    }];
}


#pragma mark -
-(UIButton*)createButtonWithTitle:(NSString*)title block:(UIControlEventBlock)block{
    UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, title, nil];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    button.backgroundColor = kWhiteColor;
    [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
    
    //添加按钮的触摸事件(按钮按下)
    [button handleEvent:UIControlEventTouchUpInside withBlock:block];
    
    return button;
}

@end
