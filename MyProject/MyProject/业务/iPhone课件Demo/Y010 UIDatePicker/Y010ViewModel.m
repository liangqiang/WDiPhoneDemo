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
                           VIEWTYPE(@"DatePickerStyle", @"显示模式(DateTime,Date,Time,秒表)"),
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
    [dateFormatter setDateFormat:kDateFormatLong];//设置时间显示样式
    NSString *dateAndTime =  [dateFormatter stringFromDate:date];
    
    return dateAndTime;
}

-(BOOL)checkTime{
    self.showTime = self.showTime - 5;
    
    if(self.showTime<=0){
        return YES;
    }else{
        return NO;
    }
}

-(void)toastTimer:(NSInteger)timer{
    NSString *time = [NSString stringWithFormat:@"剩余：%d秒",timer];
    [AJUtil toast:time];
}

@end
