//
//  Y012ViewModel3.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_3ViewModel.h"

@implementation Y012_3ViewModel

-(void)loadData{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"personArray" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    self.personArray = [NSMutableArray new];
    
    for(int i=0;i<[array count];++i){
        Y012_3PersonItem *object = [[Y012_3PersonItem alloc] initWithDictionary:[array safeObjectAtIndex:i]];
        [self.personArray addObject:object];
    }
    
    [self notifyToRefresh];
}

-(NSInteger)getPersonCount{
    return [self.personArray count];
}

-(Y012_3PersonItem*)getObjectByRow:(NSInteger)row{
    return [self.personArray safeObjectAtIndex:row];
}

@end
