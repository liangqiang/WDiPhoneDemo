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
    
    self.viewTypeArray = @[VIEWTYPE( @"AlertNormal", @"基本的提示框"),
                           VIEWTYPE( @"AlertList", @"提示框(提示信息列表形式)"),
                           VIEWTYPE( @"AlertTextField", @"提示框(用户名密码键入)"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onAlertViewClicked:(NSString*)message;{
    [AJUtil toast:message];
}

-(BOOL)checkLength:(NSString*)sender{
    if(sender.length>=8){
        return YES;
    }else{
        return NO;
    }
}

@end
