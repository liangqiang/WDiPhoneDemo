//
//  Y011ViewModel1.h
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y011ViewModel1 : YScrollViewModel

@property(nonatomic,strong)NSArray *cityArray;

-(void)onPickerViewSelected:(NSString*)msg;

@end
