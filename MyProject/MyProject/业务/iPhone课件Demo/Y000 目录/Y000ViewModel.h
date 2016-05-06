//
//  IphoneDemoListModel.h
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJTableViewModel.h"

@interface Y000ViewModel : AJTableViewModel

-(void)loadData;
-(void)onCellClicked:(NSIndexPath*)indexPath;
@end
