//
//  Y015ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/4.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y015ViewModel.h"

@implementation Y015ViewModel
//
-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"PushViewNormal", @"页面跳转(导航)"),
                           VIEWTYPE(@"PushViewAJFoundation", @"框架跳转(导航)"),
                           VIEWTYPE(@"PushViewLeftRight", @"标题左右按钮、响应事件、页面跳转(导航)"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onPushButtonClicked:(NSString*)viewName;{
    [AJNavi pushViewController:viewName];
}

@end
