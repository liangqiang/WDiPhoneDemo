//
//  Y018ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/12.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y018ViewModel : AJViewModel

@property (nonatomic, strong) NSMutableArray *hArr;

-(void)loadData;

-(NSInteger)collCount;

-(float)itemHeight:(NSInteger)row;

@end
