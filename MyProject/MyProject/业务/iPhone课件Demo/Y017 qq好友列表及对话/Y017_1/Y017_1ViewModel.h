//
//  Y017_1ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJTableViewModel.h"

@interface Y017_1ViewModel : AJTableViewModel

-(void)loadData;
-(void)onCellClicked:(NSIndexPath*)indexPath;
@end
