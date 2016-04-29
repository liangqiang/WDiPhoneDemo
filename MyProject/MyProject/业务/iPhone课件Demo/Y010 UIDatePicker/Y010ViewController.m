//
//  Y010ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y010ViewController.h"
#import "Y010ViewModel.h"
#import "AJDatePicker.h"

@interface Y010ViewController ()

@property(nonatomic,strong) Y010ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y010ViewController

//1、基本时间控件、选择时间
-(UIButton*)createDatePickerTime{
    return [self createButtonWithTitle:@"弹出时间控件" action:@selector(onDatePickerTimeClicked:)];
}

-(void)onDatePickerTimeClicked:(id)sender{
    WEAKSELF
    [AJDatePicker showWithChooseBlock:^(NSString *date) {
        [weakSelf.viewModel onDatePickerClicked:date];
    } cancelBlock:^{
    }];
}


//2、时间控件中文格式
-(UIButton*)createDatePickerDate{
    return [self createButtonWithTitle:@"弹出日期控件" action:@selector(onDatePickerDateClicked:)];
}

-(void)onDatePickerDateClicked:(id)sender{
    WEAKSELF
    AJDatePicker *datePicker = [AJDatePicker showWithChooseBlock:^(NSString *date) {
        [weakSelf.viewModel onDatePickerClicked:date];
    } cancelBlock:^{
    }];
    datePicker.datePicker.datePickerMode = UIDatePickerModeDate;
}


//3、时间控件(显示模式)
-(UIButton*)createDatePickerDateTime{
    return [self createButtonWithTitle:@"弹出日期时间控件" action:@selector(onDatePickerDateTimeClicked:)];
}

-(void)onDatePickerDateTimeClicked:(id)sender{
    WEAKSELF
    AJDatePicker *datePicker = [AJDatePicker showWithChooseBlock:^(NSString *date) {
        [weakSelf.viewModel onDatePickerClicked:date];
    } cancelBlock:^{
    }];
    datePicker.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
}


//4、时间控件(最大最小显示时间)
-(UIButton*)createDatePickerMinMaxValue{
    return [self createButtonWithTitle:@"弹出日期控件(60天内)" action:@selector(onDatePickerMinMaxValueClicked:)];
}

-(void)onDatePickerMinMaxValueClicked:(id)sender{
    WEAKSELF
    AJDatePicker *datePicker = [AJDatePicker showWithChooseBlock:^(NSString *date) {
        [weakSelf.viewModel onDatePickerClicked:date];
    } cancelBlock:^{
    }];
    datePicker.datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.datePicker.minimumDate = [[NSDate date] offsetDay:-60];
    datePicker.datePicker.maximumDate = [NSDate date];
}

#pragma mark -
-(UIButton*)createButtonWithTitle:(NSString*)title action:(SEL)action{
    UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, title, nil];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    button.backgroundColor = kWhiteColor;
    [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
