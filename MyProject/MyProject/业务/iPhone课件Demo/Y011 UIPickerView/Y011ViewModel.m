//
//  Y011ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/25.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewModel.h"

@implementation Y011ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"PickerViewNormal", @"基本滚动视图、响应事件"),
                           VIEWTYPE(@"PickerViewNormal1", @"二级滚动视图、响应事件(省市选择)"),
                           VIEWTYPE(@"PickerViewWidthHeight", @"基本滚动视图、cell大小"),
                           VIEWTYPE(@"PickerViewCustom", @"基本滚动视图、自定义cell")
                           ];
    
    [self notifyToRefresh];
}

-(void)onPickerViewSelected:(NSString*)message{
    [AJUtil toast:message];
}

@end
