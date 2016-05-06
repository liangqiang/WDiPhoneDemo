//
//  Y012ViewModel1.h
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y012_1ViewModel : AJViewModel

@property(nonatomic,strong) NSMutableArray *personArray;

-(void)loadData;

-(NSInteger)personCount;

-(NSString*)personName:(NSInteger)row;

-(void)onPersonSelected:(NSInteger)row;

@end
