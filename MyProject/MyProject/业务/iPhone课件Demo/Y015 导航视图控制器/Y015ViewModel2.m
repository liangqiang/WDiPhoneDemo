//
//  Y015ViewModel2.m
//  MyProject
//
//  Created by caoyang on 16/5/5.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y015ViewModel2.h"

@implementation Y015ViewModel2

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"PopViewNormal", @"跳转返回(导航)"),
                           VIEWTYPE(@"PopViewAJFoundation", @"跳转返回(框架)"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onBackButtonClicked{
    [AJNavi popViewController];
}

@end
