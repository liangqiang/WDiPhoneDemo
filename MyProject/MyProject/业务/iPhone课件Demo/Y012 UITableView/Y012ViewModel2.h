//
//  Y012ViewModel2.h
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y012ViewModel2 : YScrollViewModel

@property(nonatomic,strong)NSMutableDictionary *info;
@property(nonatomic,strong)NSArray *cityArray;
@property(nonatomic,strong)NSArray *infoArray;

-(NSInteger)getSection;

-(NSInteger)getNumBySection:(NSInteger)section;

-(NSString*)getInfo:(NSInteger)section row:(NSInteger)row;

-(NSString*)getTitleBySection:(NSInteger)section;

-(void)onTableViewSelected:(NSInteger)section row:(NSInteger)row;

@end
