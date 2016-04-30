//
//  Y012ViewModel2.m
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012ViewModel2.h"

@implementation Y012ViewModel2

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"GroupedTableViewNormal", @"基本表视图(Grouped)"),
                           ];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"sourceCity" ofType:@"plist"];
    NSDictionary *array = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    self.info = [NSMutableDictionary dictionaryWithDictionary:array];
    
    self.cityArray = [self.info allKeys];
    
    [self notifyToRefresh];
}

-(NSInteger)getSection{
    return [self.cityArray count];
}

-(NSInteger)getNumBySection:(NSInteger)section{
    NSString *key = [self.cityArray safeObjectAtIndex:section];
    NSArray *array = [self.info safeObjectFortKey:key];
    return [array count];
}

-(NSString*)getInfo:(NSInteger)section row:(NSInteger)row{
    NSString *key = [self.cityArray safeObjectAtIndex:section];
    NSArray *array = [self.info safeObjectFortKey:key];
    NSString *info = [array safeObjectAtIndex:row];
    return info;
}

-(NSString*)getTitleBySection:(NSInteger)section{
    return [self.cityArray safeObjectAtIndex:section];
}

-(void)onTableViewSelected:(NSInteger)section row:(NSInteger)row{
    NSString *key = [self.cityArray safeObjectAtIndex:section];
    NSArray *array = [self.info safeObjectFortKey:key];
    NSString *info = [array safeObjectAtIndex:row];
    [AJUtil toast:info];
}

@end
