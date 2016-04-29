//
//  Y011ViewModel1.m
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewModel1.h"

@implementation Y011ViewModel1

-(void)loadData{
    
    self.viewTypeArray = @[VIEWTYPE(@"PickerViewNormal", @"基本滚动视图、响应事件"),
                           ];
    
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Y011City1" ofType:@"plist"];
    self.cityArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    
    [self notifyToRefresh];
}

-(void)onPickerViewSelected:(NSString*)msg{
    [AJUtil toast:msg];
}

@end
