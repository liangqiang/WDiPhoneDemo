//
//  Y012ViewModel1.m
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012ViewModel1.h"

@implementation Y012ViewModel1

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"PlainTableViewNormal", @"基本表视图(Plain)"),
                           ];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"sourceArray" ofType:@"plist"];
    NSArray *cityArray = [NSArray arrayWithContentsOfFile:plistPath];
    self.personArray = [NSMutableArray arrayWithArray:cityArray];
    
    [self notifyToRefresh];
}

-(NSInteger)getCount{
    return [self.personArray count];
}

-(NSString*)getInfo:(NSInteger)row{
    return [self.personArray safeObjectAtIndex:row];
}

-(void)onTableViewSelected:(NSInteger)row{
    NSString *person = [self.personArray safeObjectAtIndex:row];
    [AJUtil toast:person];
}

@end
