//
//  Y016_1ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y016_1ViewModel.h"

@implementation Y016_1ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"ImageNormal", @"大家好我是第一个ViewController周润发")];
    
    [self notifyToRefresh];
}

@end
