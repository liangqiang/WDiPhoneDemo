//
//  Y002ViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y002ViewModel.h"

@implementation Y002ViewModel

-(void)loadData{
    NSArray *array = @[@"LabelSingleLine", @"LabelSingleLine2", @"LabelSingleLine3",
                       @"LabelSingleLine4", @"LabelMultiLine1", @"LabelMultiLine2",
                       @"LabelMultiLine3"];
    self.viewTypeArray = [NSMutableArray arrayWithArray:array];
    
    [self notifyToRefresh];
}

@end
