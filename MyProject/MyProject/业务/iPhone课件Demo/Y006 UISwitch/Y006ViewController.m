//
//  Y006ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/19.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y006ViewController.h"
#import "Y006ViewModel.h"

@interface Y006ViewController ()

@property(nonatomic,strong) Y006ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y006ViewController

//1、开关按钮、开关响应事件
-(UISwitch*)createSwitchNormal{
    UISwitch *theSwitch = [UISwitch new];
    theSwitch.size = CGSizeMake(self.scrollView.width - 200, 44);

    //UISwitch添加事件
    [theSwitch addTarget:self action:@selector(onNormalSwitchClick:) forControlEvents:UIControlEventValueChanged];
    
    return theSwitch;
}

-(void)onNormalSwitchClick:(id)sender{
    [self.viewModel onSwitchClicked:sender];
}

//2、开关状态
-(UISwitch*)createSwitchNormal1{
    UISwitch *theSwitch = [UISwitch new];
    theSwitch.size = CGSizeMake(self.scrollView.width - 200, 44);
    
    //UISwitch添加事件
    [theSwitch addTarget:self action:@selector(onNormalSwitchClick:) forControlEvents:UIControlEventValueChanged];
    
    [theSwitch setOn:YES];
    
    return theSwitch;
}

//3、开关颜色
-(UISwitch*)createSwitchColor{
    UISwitch *theSwitch = [UISwitch new];
    theSwitch.size = CGSizeMake(self.scrollView.width - 200, 44);
    
    //UISwitch添加事件
    [theSwitch addTarget:self action:@selector(onNormalSwitchClick:) forControlEvents:UIControlEventValueChanged];
    
    theSwitch.tintColor = kGrayColor;
    theSwitch.onTintColor = kRedColor;
    theSwitch.thumbTintColor = kBlackColor;
    
    return theSwitch;
}

@end
