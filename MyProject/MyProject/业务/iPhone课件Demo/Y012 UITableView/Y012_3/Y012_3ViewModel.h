//
//  Y012ViewModel3.h
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"
#import "Y012_3PersonItem.h"

@interface Y012_3ViewModel : YScrollViewModel

@property(nonatomic,strong)NSMutableArray *personArray;

-(NSInteger)getPersonCount;

-(Y012_3PersonItem*)getObjectByRow:(NSInteger)row;

@end
