//
//  Y008ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y008ViewModel.h"

@implementation Y008ViewModel

-(void)loadData{
    
    self.viewTypeArray = @[VIEWTYPE(@"AlertViewNormal", @"基本提示框(AlertView)"),
                           VIEWTYPE(@"AJAlertNormal", @"基本提示框(阿剑框架)"),
                           VIEWTYPE(@"AlertNormal", @"基本提示框（UIAlertController）"),
                           VIEWTYPE(@"AlertList", @"多按钮列表(UIAlertController)"),
                           VIEWTYPE(@"AlertTextField", @"提示框(用户名密码键入)"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onAlertViewClicked:(NSString*)message;{
    [AJUtil toast:message];
}

@end
