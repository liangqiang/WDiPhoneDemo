//
//  Y010ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y010ViewModel : YScrollViewModel

@property(nonatomic)NSInteger showTime;

-(void)onDatePickerClicked:(UIDatePicker*)datePicker;

-(NSString*)getFormatTimer:(NSDate*)date;

-(BOOL)checkTime;

@end
