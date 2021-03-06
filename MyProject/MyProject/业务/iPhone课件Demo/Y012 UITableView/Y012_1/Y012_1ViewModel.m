//
//  Y012ViewModel1.m
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_1ViewModel.h"

@implementation Y012_1ViewModel

-(void)loadData{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Y012_1Person" ofType:@"plist"];
    NSArray *cityArray = [NSArray arrayWithContentsOfFile:plistPath];
    self.personArray = [NSMutableArray arrayWithArray:cityArray];
    
    [self notifyToRefresh];
}

-(NSInteger)personCount{
    return [self.personArray count];
}

-(NSString*)personName:(NSInteger)row{
    return [self.personArray safeObjectAtIndex:row];
}

-(void)onPersonSelected:(NSInteger)row{
    NSString *person = [self.personArray safeObjectAtIndex:row];
    [AJUtil toast:person];
}

@end
