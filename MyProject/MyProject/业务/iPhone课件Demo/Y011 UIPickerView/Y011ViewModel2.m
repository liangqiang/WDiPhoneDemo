//
//  Y011ViewModel2.m
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewModel2.h"

@implementation Y011ViewModel2

-(void)loadData{
    
    self.viewTypeArray = @[VIEWTYPE(@"PickerViewNormal", @"二级滚动视图、响应事件(省市选择)"),
                           ];
    
    
    NSString *plistPath1 = [[NSBundle mainBundle] pathForResource:@"Y011City2" ofType:@"plist"];
    self.provinceCityDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath1];
    //省数组
    self.province = [self.provinceCityDic allKeys];
    //市数组
    NSString *seletedProvince = [self.province objectAtIndex:0];
    self.city = [self.provinceCityDic objectForKey:seletedProvince];
    
    
    [self notifyToRefresh];
}

-(void)onPickerViewSelected:(NSString*)msg{
    [AJUtil toast:msg];
}

@end
