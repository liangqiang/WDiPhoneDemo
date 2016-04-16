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
        
    NSString *bundleFile = [[NSBundle mainBundle] pathForResource: @"Y000" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:bundleFile];
    for (NSString *key in dict.allKeys) {
        AJNormalItem *item = [AJNormalItem new];
        item.title = key;
        item.actionType = @"PushVC";
        item.actionContent = [dict safeObjectFortKey:key];
        [sectionItem.cellDataArray addObject:item];
    }

    [self notifyToRefresh];
}

-(void)onCellClicked:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:indexPath.section];
    AJNormalItem *item = [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];
    [item pushViewController];
}

@end
