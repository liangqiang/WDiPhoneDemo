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
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Y012_3Person" ofType:@"plist"];
    NSArray *personArray = [NSArray arrayWithContentsOfFile:plistPath];
    
    self.personArray = [NSMutableArray new];
    for(int i=0;i<[personArray count];++i){
        Y012_3PersonItem *personItem = [[Y012_3PersonItem alloc] initWithDictionary:[personArray safeObjectAtIndex:i]];
        [self.personArray addObject:personItem];
    }
    
    [self notifyToRefresh];
}

-(NSInteger)personCount{
    return [self.personArray count];
}

-(Y012_3PersonItem*)personAtRow:(NSInteger)row{
    return [self.personArray safeObjectAtIndex:row];
}

@end
