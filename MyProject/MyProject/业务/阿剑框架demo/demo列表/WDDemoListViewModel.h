//
//  WDAJDemoListViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJTableViewModel.h"

@interface WDDemoListViewModel : AJTableViewModel

-(void)loadData;
-(void)onCellClicked:(NSIndexPath*)indexPath;

@end
