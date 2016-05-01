//
//  AJNormalItem1.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJNormalItem1.h"

@implementation AJNormalItem1

+(NSMutableArray*)createArray:(NSArray*)itemArray{
    NSMutableArray *outputArray = [NSMutableArray array];
    for (NSArray *infos in itemArray) {
        AJNormalItem1 *cellItem = [AJNormalItem1 new];
        
        cellItem.name = [infos safeObjectFortKey:@"name"];
        cellItem.sex = [infos safeObjectFortKey:@"sex"];
        cellItem.age = [infos safeObjectFortKey:@"age"];
        
        [outputArray addObject:cellItem];
    }
    return outputArray;
}

@end
