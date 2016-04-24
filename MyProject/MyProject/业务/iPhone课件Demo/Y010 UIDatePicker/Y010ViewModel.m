//
//  Y010ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y010ViewModel.h"

@implementation Y010ViewModel

-(void)loadData{
    
    self.viewTypeArray = @[VIEWTYPE(@"DatePickerNormal", @"基本时间控件、选择时间"),
                           VIEWTYPE(@"DatePickerChina", @"时间控件(中文显示格式)"),
                           VIEWTYPE(@"DatePickerStyle", @"时间控件(时间样式)"),
                           VIEWTYPE(@"DatePickerMinMaxValue", @"时间控件(选择最大时间、最小时间)"),
                           VIEWTYPE(@"DatePickerTimer", @"控件(秒表显示效果)"),
                           ];
    
    
    [self notifyToRefresh];
}

-(void)onDatePickerClicked:(UIDatePicker*)datePicker{
    [AJUtil toast:[self getFormatTimer:datePicker.date]];
}

-(NSString*)getFormatTimer:(NSDate*)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];//设置时间显示样式
    NSString *dateAndTime =  [dateFormatter stringFromDate:date];
    
    return dateAndTime;
}

@end
