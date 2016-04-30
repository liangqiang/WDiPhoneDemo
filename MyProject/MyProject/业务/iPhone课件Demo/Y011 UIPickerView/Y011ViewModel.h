//
//  Y011ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y011ViewModel : YScrollViewModel

@property (nonatomic,strong) NSMutableArray *cityComponentArray;

-(void)onCitySelected:(NSInteger)component row:(NSInteger)row;

// 二级
@property (nonatomic,strong) NSDictionary *allProvinces;
@property (nonatomic,strong) NSMutableArray *provinceComponentArray;
@property (nonatomic,strong) NSString *selectedProvince;
@property (nonatomic,strong) NSString *selectedCity;

-(void)onProvinceSelectd:(NSInteger)componet row:(NSInteger)row;

@end
