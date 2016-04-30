//
//  Y012ViewModel1.h
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y012ViewModel1 : YScrollViewModel

@property(nonatomic,strong)NSMutableArray *personArray;

-(void)onTableViewSelected:(NSInteger)row;

@end
