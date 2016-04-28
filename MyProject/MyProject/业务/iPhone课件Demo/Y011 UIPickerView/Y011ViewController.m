//
//  Y011ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/25.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewController.h"
#import "Y011ViewModel.h"

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
    
}

//2、二级滚动视图、响应事件(省市选择)
-(UIButton*)createPickerViewNormal1{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onPickerViewNormal1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onPickerViewNormal1Clicked:(id)sender{
    
}

//3、基本滚动视图、cell大小
-(UIButton*)createPickerViewWidthHeight{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onPickerViewWidthHeightClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onPickerViewWidthHeightClicked:(id)sender{

}

//4、基本滚动视图、自定义cell
-(UIButton*)createPickerViewCustom{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onPickerViewCustomClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onPickerViewCustomClicked:(id)sender{

}

@end
