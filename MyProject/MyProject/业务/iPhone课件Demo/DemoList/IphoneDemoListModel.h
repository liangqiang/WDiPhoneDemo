//
//  IphoneDemoListModel.h
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface IphoneDemoListModel : AJViewModel
@property (nonatomic,strong) NSMutableArray *sectionArray; //AJSectionItem

-(void)loadData;
-(void)onCellClicked:(NSIndexPath*)indexPath;
@end
