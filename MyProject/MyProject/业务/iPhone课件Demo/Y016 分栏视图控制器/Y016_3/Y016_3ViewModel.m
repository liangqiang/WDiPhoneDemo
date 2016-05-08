//
//  Y016_3ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y016_3ViewModel.h"

@implementation Y016_3ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"ImageNormal", @"大家好我是第三个ViewController张学友")];
    
    [self notifyToRefresh];
}

@end
