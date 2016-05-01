//
//  Y012ViewModel3.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012ViewModel3.h"

@implementation Y012ViewModel3

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"CustomTableViewNormal", @"表视图(自定义cell内容)"),
                           ];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"personArray" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    self.personArray = [NSMutableArray new];
    
    for(int i=0;i<[array count];++i){
        Y012CustomObject *object = [[Y012CustomObject alloc] initWithDictionary:[array safeObjectAtIndex:i]];
        [self.personArray addObject:object];
    }
    
    [self notifyToRefresh];
}

-(NSInteger)getPersonCount{
    return [self.personArray count];
}

-(Y012CustomObject*)getObjectByRow:(NSInteger)row{
    return [self.personArray safeObjectAtIndex:row];
}

@end
