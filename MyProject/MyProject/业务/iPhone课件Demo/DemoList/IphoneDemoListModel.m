//
//  IphoneDemoListModel.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "IphoneDemoListModel.h"
#import "WDButtonItem.h"

@implementation IphoneDemoListModel

-(instancetype)init{
    if (self=[super init]) {
        self.sectionArray = [NSMutableArray arrayWithObject:[AJSectionItem new]];
    }
    return self;
}

-(void)loadData{
    AJSectionItem *sectionItem = [self.sectionArray firstObject];
    [sectionItem.cellDataArray removeAllObjects];
    
    [sectionItem.cellDataArray addObject:[WDButtonItem newWithTitle:@"001" selector:@selector(on001Click)]];
    
    
    [self notifyToRefresh];
}

-(void)onCellClicked:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:indexPath.section];
    WDButtonItem *item = [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];
    [AJUtil performSelector:item.selector onTarget:self];
}
-(void)on001Click{
    [AJUtil toast:@"IphoneDemoClick"];
    [AJNavi pushViewController:@"Y001ViewController"];
}


@end
