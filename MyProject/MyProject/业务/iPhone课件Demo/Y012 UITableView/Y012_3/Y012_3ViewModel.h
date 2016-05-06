//
//  Y012ViewModel3.h
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"
#import "Y012_3PersonItem.h"

@interface Y012_3ViewModel : AJViewModel

@property(nonatomic,strong)NSMutableArray *personArray;

-(void)loadData;

-(NSInteger)personCount;

-(Y012_3PersonItem*)personAtRow:(NSInteger)row;

@end
