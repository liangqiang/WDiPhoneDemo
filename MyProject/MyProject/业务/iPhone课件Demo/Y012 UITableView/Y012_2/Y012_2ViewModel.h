//
//  Y012ViewModel2.h
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y012_2ViewModel : AJViewModel

@property(nonatomic,strong)NSDictionary *allCityArray;
@property(nonatomic,strong)NSArray *regionArray;

-(void)loadData;

-(NSInteger)regionCount;

-(NSInteger)cityCountAtSection:(NSInteger)section;

-(NSString*)cityNameAtSection:(NSInteger)section row:(NSInteger)row;

-(NSString*)regionNameAtSection:(NSInteger)section;

-(void)onTableViewSelected:(NSInteger)section row:(NSInteger)row;

@end
