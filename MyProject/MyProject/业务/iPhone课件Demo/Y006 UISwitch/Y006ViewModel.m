//
//  Y006ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/19.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y006ViewModel.h"

@implementation Y006ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE( @"SwitchNormal", @"开关按钮(点击响应)"),
                           VIEWTYPE( @"SwitchNormal1", @"开关按钮(设置初始状态)"),
                           VIEWTYPE( @"SwitchColor", @"开关按钮(开关颜色)"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onSwitchClicked:(UISwitch*)theSwitch{
    if(theSwitch.isOn){
        [AJUtil toast:@"打开了开关"];
    }
    else{
        [AJUtil toast:@"关闭了开关"];
    }
}

@end
