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
    
    self.viewTypeArray = @[VIEWTYPE(@"DatePickerPopup", @"时间控件(弹出)"),
                           VIEWTYPE(@"DatePickerTime", @"时间控件（选择时间）"),
                           VIEWTYPE(@"DatePickerDate", @"时间控件（选择日期，指定最大最小值）"),
                           VIEWTYPE(@"DatePickerDateTime", @"时间控件（选择日期时间）"),
                           
                           ];
    
    
    [self notifyToRefresh];
}

-(void)onDatePickerClicked:(UIDatePicker*)datePicker{
    NSDate *selected = [datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (datePicker.datePickerMode == UIDatePickerModeTime) {
        [dateFormatter setDateFormat:@"HH:mm"];
    }else if (datePicker.datePickerMode == UIDatePickerModeDate){
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }else{
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    NSString *dateStr = [dateFormatter stringFromDate:selected];
    [AJUtil toast:dateStr];
}

@end
