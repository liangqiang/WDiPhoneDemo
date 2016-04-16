//
//  IphoneDemoListModel.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y000ViewModel.h"

@implementation Y000ViewModel

-(instancetype)init{
    if (self=[super init]) {
        self.sectionArray = [NSMutableArray arrayWithObject:[AJSectionItem new]];
    }
    return self;
}

-(void)loadData{
    AJSectionItem *sectionItem = [self.sectionArray firstObject];
    [sectionItem.cellDataArray removeAllObjects];
    
    NSArray *array = @[@[@"Y001 UIButton", @"Y001ViewController"],
                       @[@"Y002 UILabel", @"Y002ViewController"],
                       @[@"Y003 UITextField", @"Y003ViewController"],
                       ];
    NSMutableArray *itemArray = [AJNormalItem createArray:array withType:@"PushVC"];
    [sectionItem.cellDataArray addObjectsFromArray:itemArray];
    
    [self notifyToRefresh];
}

-(void)onCellClicked:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:indexPath.section];
    AJNormalItem *item = [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];
    [item pushViewController];
}

@end
