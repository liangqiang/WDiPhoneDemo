//
//  Y015ViewController2.m
//  MyProject
//
//  Created by caoyang on 16/5/5.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y015ViewController2.h"
#import "Y015ViewModel2.h"

@interface Y015ViewController2 ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y015ViewModel2 *viewModel;
@end

@implementation Y015ViewController2

-(instancetype)init{
    if(self = [super init]){
        self.title = @"新进入View";
    }
    
    return self;
}

//1、跳转返回(导航)
-(UIButton*)createPopViewNormal{
    WEAKSELF
    return [self createButtonWithTitle:@"跳转返回" block:^(UIControl *control) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}


//2、跳转返回(框架)
-(UIButton*)createPopViewAJFoundation{
    WEAKSELF
    return [self createButtonWithTitle:@"跳转返回" block:^(UIControl *control) {
        [weakSelf.viewModel onBackButtonClicked];
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
