//
//  Y017_1ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJTableViewModel.h"
@class Y017_1CellFrameModel;

@interface Y017_1ViewModel : AJTableViewModel

@property (nonatomic, strong) NSMutableArray *cellFrameDatas;

-(void)loadData;

-(NSInteger)cellCount;

-(CGFloat)cellHeightAtRow:(NSInteger)row;

-(Y017_1CellFrameModel*)cellFrameModelAtRow:(NSInteger)row;

@end
