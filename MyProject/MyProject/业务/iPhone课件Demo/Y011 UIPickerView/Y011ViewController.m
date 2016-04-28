//
//  Y011ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/25.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewController.h"
#import "Y011ViewModel.h"

#import "Y011PickerViewNormalView.h"
#import "Y011PickerViewNormal1View.h"
#import "Y011PickerViewWidthHeightView.h"
#import "Y011PickerViewCustomView.h"

@interface Y011ViewController ()

@property(nonatomic,strong) Y011ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y011ViewController

-(UIButton*)createActionButton{
    UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, @"弹出滚动视图", nil];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    button.backgroundColor = kWhiteColor;
    [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
    return button;
}

//1、基本滚动视图、响应事件
-(UIButton*)createPickerViewNormal{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onPickerViewNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onPickerViewNormalClicked:(id)sender{
    Y011PickerViewNormalView* theView = [[Y011PickerViewNormalView alloc] init];
    theView.viewModel = self.viewModel;
    theView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    [self.view addSubview:theView];
}


//2、二级滚动视图、响应事件(省市选择)
-(UIButton*)createPickerViewNormal1{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onPickerViewNormal1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onPickerViewNormal1Clicked:(id)sender{
    Y011PickerViewNormal1View* theView = [[Y011PickerViewNormal1View alloc] init];
    theView.viewModel = self.viewModel;
    theView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    [self.view addSubview:theView];
}


//3、基本滚动视图、cell大小
-(UIButton*)createPickerViewWidthHeight{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onPickerViewWidthHeightClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onPickerViewWidthHeightClicked:(id)sender{
    Y011PickerViewWidthHeightView* theView = [[Y011PickerViewWidthHeightView alloc] init];
    theView.viewModel = self.viewModel;
    theView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    [self.view addSubview:theView];
}


//4、基本滚动视图、自定义cell
-(UIButton*)createPickerViewCustom{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onPickerViewCustomClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onPickerViewCustomClicked:(id)sender{
    Y011PickerViewCustomView* theView = [[Y011PickerViewCustomView alloc] init];
    theView.viewModel = self.viewModel;
    theView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    [self.view addSubview:theView];
}


@end
