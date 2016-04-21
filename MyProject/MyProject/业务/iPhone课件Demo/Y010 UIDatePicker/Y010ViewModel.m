//
//  Y010ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y010ViewModel.h"

@implementation Y010ViewModel

-(void)loadData{
    NSArray *array = @[@"DatePickerNormal",@"DatePickerChina",@"DatePickerStyle",@"DatePickerMinMaxValue",@"DatePickerTimer"];
    
    self.viewTypeArray = [NSMutableArray arrayWithArray:array];
    
    [self notifyToRefresh];
}

-(void)submit{
    [AJUtil toast:self.dateMessage];
}

@end
