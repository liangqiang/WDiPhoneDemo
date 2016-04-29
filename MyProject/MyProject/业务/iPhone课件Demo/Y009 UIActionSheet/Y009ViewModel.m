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
    self.viewTypeArray = @[VIEWTYPE(@"ActionSheetNormal", @"上拉菜单(AlertController)"),
                           VIEWTYPE(@"ActionSheetNormal1", @"上拉菜单(ActionSheet)"),
                           VIEWTYPE(@"AJActionSheet", @"上拉菜单(阿剑框架)"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onActionSheetClicked:(NSString*)message{
    [AJUtil toast:message];
}

@end
