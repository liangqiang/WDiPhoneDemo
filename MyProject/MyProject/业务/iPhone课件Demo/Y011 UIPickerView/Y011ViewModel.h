//
//  Y011ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/25.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y011ViewModel : YScrollViewModel

//
@property(nonatomic,strong)NSMutableArray *cityArray;

//
@property(nonatomic,strong)NSMutableDictionary* provinceCityDic;
@property(nonatomic,strong)NSArray* province;
@property(nonatomic,strong)NSArray* city;

-(void)onPickerViewSelected:(NSString*)message;

@end
