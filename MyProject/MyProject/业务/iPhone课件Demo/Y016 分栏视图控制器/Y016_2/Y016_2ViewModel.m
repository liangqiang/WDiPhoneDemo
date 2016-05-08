//
//  Y016_2ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y016_2ViewModel.h"

@implementation Y016_2ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"ImageNormal", @"大家好我是第二个ViewController刘德华")];
    
    [self notifyToRefresh];
}

@end
