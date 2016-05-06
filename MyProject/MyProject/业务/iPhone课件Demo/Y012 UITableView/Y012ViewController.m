//
//  Y012ViewController.m
//  MyProject
//
//  Created by liangqiang on 16/5/6.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012ViewController.h"
#import "Y012ViewModel.h"

@interface Y012ViewController ()

@property(nonatomic,strong) Y012ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y012ViewController

-(UIButton*)createTableViewNormal{
    WEAKSELF
    return [self createButtonWithTitle:@"简单表格" block:^(UIControl *control) {
        [weakSelf.viewModel onViewTypeButtonClicked:@"TableViewNormal"];
    }];
}

-(UIButton*)createTableViewGrouped{
    WEAKSELF
    return [self createButtonWithTitle:@"分组表格" block:^(UIControl *control) {
        [weakSelf.viewModel onViewTypeButtonClicked:@"TableViewGrouped"];
    }];
}

-(UIButton*)createTableViewCustom{
    WEAKSELF
    return [self createButtonWithTitle:@"自定义表格" block:^(UIControl *control) {
        [weakSelf.viewModel onViewTypeButtonClicked:@"TableViewCustom"];
    }];
}

-(UIButton*)createTableViewFramework{
    WEAKSELF
    return [self createButtonWithTitle:@"自定义表格（框架）" block:^(UIControl *control) {
        [weakSelf.viewModel onViewTypeButtonClicked:@"TableViewCustom"];
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
