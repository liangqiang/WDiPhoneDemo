//
//  Y012ViewModel4.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_4ViewModel.h"

@implementation Y012_4ViewModel

-(instancetype)init{
    if (self=[super init]) {
        self.sectionArray = [NSMutableArray arrayWithObject:[AJSectionItem new]];
    }
    return self;
}

-(void)loadData{
    AJSectionItem *sectionItem = [self.sectionArray firstObject];
    [sectionItem.cellDataArray removeAllObjects];
    
    NSString *bundleFile = [[NSBundle mainBundle] pathForResource: @"AJPersonArray" ofType: @"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:bundleFile];
    
    for(NSDictionary *dict in array){
        AJNormalItem1 *item = [AJNormalItem1 new];
        item.name = [dict safeObjectFortKey:@"name"];
        item.sex = [dict safeObjectFortKey:@"sex"];
        item.age = [dict safeObjectFortKey:@"age"];
        [sectionItem.cellDataArray addObject:item];
    }
    
    [self notifyToRefresh];
}

-(void)onCellClicked:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray safeObjectAtIndex:indexPath.section];
    AJNormalItem1 *item = [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];
    
    NSString *msg = [NSString stringWithFormat:@"姓名:%@,性别:%@,年龄:%@",item.name,item.sex,item.age];
    
    [AJUtil toast:msg];
    
    //[AJNavi pushViewController:@"Your's ViewController"];
}


@end
