//
//  Y012ViewModel3.h
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"
#import "Y012CustomObject.h"

@interface Y012ViewModel3 : YScrollViewModel

@property(nonatomic,strong)NSMutableArray *personArray;

-(NSInteger)getPersonCount;

-(Y012CustomObject*)getObjectByRow:(NSInteger)row;

@end
