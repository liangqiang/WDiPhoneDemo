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
    
    self.viewTypeArray = @[VIEWTYPE(@"DatePickerTime", @"时间控件（选择时间）"),
                           VIEWTYPE(@"DatePickerDate", @"时间控件（选择日期）"),
                           VIEWTYPE(@"DatePickerDateTime", @"时间控件（选择日期时间）"),
                           VIEWTYPE(@"DatePickerMinMaxValue", @"时间控件(选择最大时间、最小时间)"),
                           ];
    
    
    [self notifyToRefresh];
}

-(void)onDatePickerClicked:(NSString*)date{
    [AJUtil toast:date];
}

@end
