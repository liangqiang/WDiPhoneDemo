//
//  Y006ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/19.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y006ViewModel : AJViewModel

@property(nonatomic,strong) NSArray *viewTypeArray;

-(void)loadData;

-(void)onSwitchClicked:(UISwitch*)theSwitch;

@end
