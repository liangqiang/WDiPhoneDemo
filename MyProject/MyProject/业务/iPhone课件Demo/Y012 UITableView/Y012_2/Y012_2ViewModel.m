//
//  Y012ViewModel2.m
//  MyProject
//
//  Created by caoyang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_2ViewModel.h"

@implementation Y012_2ViewModel

-(void)loadData{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Y012_2City" ofType:@"plist"];
    self.allCityArray = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    self.regionArray = [self.allCityArray allKeys];
    
    [self notifyToRefresh];
}

-(NSInteger)regionCount{
    return [self.regionArray count];
}

-(NSInteger)cityCountAtSection:(NSInteger)section{
    NSString *region = [self.regionArray safeObjectAtIndex:section];
    NSArray *cityArray = [self.allCityArray safeObjectFortKey:region];
    return [cityArray count];
}

-(NSString*)cityNameAtSection:(NSInteger)section row:(NSInteger)row{
    NSString *region = [self.regionArray safeObjectAtIndex:section];
    NSArray *cityArray = [self.allCityArray safeObjectFortKey:region];
    NSString *cityName = [cityArray safeObjectAtIndex:row];
    return cityName;
}

-(NSString*)regionNameAtSection:(NSInteger)section{
    return [self.regionArray safeObjectAtIndex:section];
}

-(void)onTableViewSelected:(NSInteger)section row:(NSInteger)row{
    NSString *region = [self.regionArray safeObjectAtIndex:section];
    NSArray *cityArray = [self.allCityArray safeObjectFortKey:region];
    NSString *cityName = [cityArray safeObjectAtIndex:row];
    [AJUtil toast:cityName];
}

@end
