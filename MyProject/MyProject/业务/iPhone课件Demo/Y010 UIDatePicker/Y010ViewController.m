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
-(UIDatePicker*)createDatePickerTime{
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.view.width, 160);
    datePicker.datePickerMode = UIDatePickerModeTime;
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"Chinese"]];
    
    WEAKSELF
    [datePicker handleEvent:UIControlEventValueChanged withBlock:^(UIControl *control) {
        [weakSelf.viewModel onDatePickerClicked:(UIDatePicker*)control];
    }];
    
    return datePicker;
}

//2、时间控件中文格式
-(UIDatePicker*)createDatePickerDate{
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.view.width, 160);
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"Chinese"]];
    
    NSDate *today = [NSDate date];
    datePicker.minimumDate = [today offsetDay:-60];
    datePicker.maximumDate = today;
    [datePicker setDate:[today offsetDay:-5]]; // 设置日期
    
    WEAKSELF
    [datePicker handleEvent:UIControlEventValueChanged withBlock:^(UIControl *control) {
        [weakSelf.viewModel onDatePickerClicked:(UIDatePicker*)control];
    }];
    
    return datePicker;
}


//3、时间控件(显示模式)
-(UIDatePicker*)createDatePickerDateTime{
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.view.width, 160);
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"Chinese"]];
    
    WEAKSELF
    [datePicker handleEvent:UIControlEventValueChanged withBlock:^(UIControl *control) {
        [weakSelf.viewModel onDatePickerClicked:(UIDatePicker*)control];
    }];
    
    return datePicker;
}

//4、时间控件(最大最小显示时间)
-(UIButton*)createDatePickerPopup{
    return [self createButtonWithTitle:@"弹出日期控件" action:@selector(onDatePickerMinMaxValueClicked:)];
}

-(void)onDatePickerMinMaxValueClicked:(id)sender{
    AJDatePicker *datePicker = [AJDatePicker showWithChooseBlock:^(NSString *date) {
        [AJUtil toast:date];
    } cancelBlock:^{
    }];
    datePicker.datePicker.datePickerMode = UIDatePickerModeDate;
    NSDate *today = [NSDate date];
    datePicker.datePicker.minimumDate = [today offsetMonth:-24];
    datePicker.datePicker.maximumDate = today;
    [datePicker.datePicker setDate:[today offsetDay:-5]]; // 设置日期
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
