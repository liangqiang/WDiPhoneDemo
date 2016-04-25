//
//  Y009ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y009ViewModel.h"

@implementation Y009ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"ActionSheetNormal", @"基本多选择控制器、响应事件"),
                           VIEWTYPE(@"ActionSheetNormal1", @"多选择控制器(ActionSheet)"),
                           VIEWTYPE(@"AJActionSheet", @"框架(多选择器)"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onActionSheetClicked:(NSString*)message{
    [AJUtil toast:message];
}

@end
