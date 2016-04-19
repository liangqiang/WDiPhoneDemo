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
    NSArray *array = @[@"SwitchNormal",@"SwitchNormal1"];
    
    self.viewTypeArray = [NSMutableArray arrayWithArray:array];
    
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
