//
//  Y016_4ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y016_4ViewModel.h"

@implementation Y016_4ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"ImageNormal", @"大家好我是第四个ViewController周星驰")];
    
    [self notifyToRefresh];
}

@end
