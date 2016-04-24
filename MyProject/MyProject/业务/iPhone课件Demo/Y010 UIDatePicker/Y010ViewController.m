//
//  Y010ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y010ViewController.h"
#import "Y010ViewModel.h"

@interface Y010ViewController ()

@property(nonatomic,strong) Y010ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong) UIView *datePickerView;
@property(nonatomic,strong) UIDatePicker *datePicker;

@property(nonatomic,strong) NSTimer* timer;

@end

@implementation Y010ViewController

//单个button
-(UIButton*)createButton:(NSString*)title{
    UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, title, nil];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    button.backgroundColor = kWhiteColor;
    [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
    return button;
}

//单个View
-(UIView*)createSimpleView{
    UIView *newView = [UIView new];
    newView.size = CGSizeMake(self.view.width, self.view.height);
    newView.backgroundColor = kGrayColor;
    return newView;
}

//创建View(取消、确认按钮)
-(UIView*)createView{
    UIView *newView = [self createSimpleView];
    [self.view addSubview:newView];
    
    //取消按钮
    UIButton *buttonCancel = [self createButton:@"取消"];
    buttonCancel.frame = CGRectMake(10, 200, 120, 40);
    //添加按钮的触摸事件(按钮按下)
    [buttonCancel addTarget:self action:@selector(onCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //确认按钮
    UIButton *buttonCinfirm = [self createButton:@"确认"];
    float leftWidth = self.view.width-10-120;
    buttonCinfirm.frame = CGRectMake(leftWidth, 200, 120, 40);
    //添加按钮的触摸事件(按钮按下)
    [buttonCinfirm addTarget:self action:@selector(onCinfirmClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [newView addSubview:buttonCancel];
    [newView addSubview:buttonCinfirm];
    
    self.datePickerView = newView;
    
    return newView;
}

-(void)onCancelClicked:(id)sender{
    
    [self.viewModel onDatePickerClicked:nil];
    
    [self.datePickerView removeFromSuperview];
}
-(void)onCinfirmClicked:(id)sended{
    
    [self.viewModel onDatePickerClicked:self.datePicker];
    
    [self.datePickerView removeFromSuperview];
}


//1、基本时间控件、选择时间
-(UIButton*)createDatePickerNormal{
    UIButton *button = [self createButton:@"弹出时间控件"];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onDatePickerNormalClicked:(id)sender{
    UIView *newView = [self createView];
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    [newView addSubview:datePicker];
    
    self.datePicker = datePicker;
}


//2、时间控件中文格式
-(UIButton*)createDatePickerChina{
    UIButton *button = [self createButton:@"弹出时间控件"];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerChinaClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onDatePickerChinaClicked:(id)sender{
    
    UIView *view = [self createView];
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    
    //设置控件成中文模式
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    //[datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"] ];
    
    [view addSubview:datePicker];
    
    self.datePicker = datePicker;
}


//3、时间控件(显示模式)
-(UIButton*)createDatePickerStyle{
    UIButton *button = [self createButton:@"弹出时间控件"];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerStyleClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onDatePickerStyleClicked:(id)sender{
    
    UIView *view = [self createView];
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    
    //设置控件成中文模式
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    //[datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"] ];
    
    // 显示模式(1、年月日 2、年月日 时分秒 3、时分秒 4、秒表)
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    [view addSubview:datePicker];
    
    self.datePicker= datePicker;
}


//4、时间控件(最大最小显示时间)
-(UIButton*)createDatePickerMinMaxValue{
    UIButton *button = [self createButton:@"弹出时间控件"];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerMinMaxValueClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onDatePickerMinMaxValueClicked:(id)sender{
    UIView *view = [self createView];
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    
    //设置控件成中文模式
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    //[datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"] ];
    
    // 显示模式(1、年月日 2、年月日 时分秒 3、时分秒 4、秒表)
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    //设定控件的最大选择时间和最小选择时间
    NSDate *dateMin=[NSDate date];
    datePicker.minimumDate=dateMin;
    NSDate *dateMax=[NSDate dateWithTimeIntervalSinceNow:365*24*60*60];
    datePicker.maximumDate=dateMax;
    
    
    [view addSubview:datePicker];
    
    self.datePicker = datePicker;
}


//5、秒表
-(UIButton*)createDatePickerTimer{
    UIButton *button = [self createButton:@"弹出秒表控件"];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerTimerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onDatePickerTimerClicked:(id)sender{
    
    UIView *newView = [self createSimpleView];
    [self.view addSubview:newView];
    
    UIButton *buttonCancel = [self createButton:@"停止"];
    buttonCancel.frame = CGRectMake(10, 200, 120, 40);
    //添加按钮的触摸事件(按钮按下)
    [buttonCancel addTarget:self action:@selector(onStopClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonCinfirm = [self createButton:@"开始"];
    float leftWidth = self.view.width-10-120;
    buttonCinfirm.frame = CGRectMake(leftWidth, 200, 120, 40);
    //添加按钮的触摸事件(按钮按下)
    [buttonCinfirm addTarget:self action:@selector(onStartClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [newView addSubview:buttonCancel];
    [newView addSubview:buttonCinfirm];
    self.datePickerView = newView;
    
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    
    // 显示模式
    [datePicker setDatePickerMode:UIDatePickerModeCountDownTimer];
    [datePicker addTarget:self action:@selector(datePickerValueChanged1:) forControlEvents:UIControlEventValueChanged];
    
    [newView addSubview:datePicker];
    
    
    //获取控件时间长度
    self.viewModel.showTime = datePicker.countDownDuration;
    
    self.datePicker = datePicker;
}
-(void)datePickerValueChanged1:(id)sender{
    UIDatePicker* datePicker = (UIDatePicker*)sender;
    
    self.viewModel.showTime = datePicker.countDownDuration;
}

-(void)onStopClicked:(id)sender{
    [self.timer invalidate]; //停止定时器
    [self.datePickerView removeFromSuperview];
}

-(void)onStartClicked:(id)sender{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:60
                                             target:self selector:@selector(timeRun)
                                           userInfo:nil repeats:YES];
}

-(void)timeRun{
    // 如果剩余时间小于等于0
    if(self.viewModel.checkTime){
        // 取消定时器
        [self.timer invalidate];
    }
    
    // 修改UIDatePicker的剩余时间
    self.datePicker.countDownDuration = self.viewModel.showTime;
}

@end
