//
//  Y011ViewModel2.h
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y011ViewModel2 : YScrollViewModel

@property(nonatomic,strong)NSMutableDictionary* provinceCityDic;
@property(nonatomic,strong)NSArray* province;
@property(nonatomic,strong)NSArray* city;

-(void)onPickerViewSelected:(NSString*)msg;

@end
