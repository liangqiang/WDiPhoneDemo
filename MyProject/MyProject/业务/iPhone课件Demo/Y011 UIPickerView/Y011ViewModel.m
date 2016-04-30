//
//  Y011ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewModel.h"

@implementation Y011ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"PickerViewNormal", @"基本滚动视图、响应事件"),
                           VIEWTYPE(@"PickerViewNormal2", @"二级滚动视图、响应事件(省市选择)"),
                           VIEWTYPE(@"PickerViewCustom", @"自定义滚动视图、cell宽、高、自定义cell"),
                           ];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Y011City1" ofType:@"plist"];
    NSArray *cityArray = [NSArray arrayWithContentsOfFile:plistPath];
    self.cityComponentArray = [NSMutableArray arrayWithObject:cityArray];
    
    NSString *plistPath2 = [[NSBundle mainBundle] pathForResource:@"Y011City2" ofType:@"plist"];
    self.allProvinces = [NSDictionary dictionaryWithContentsOfFile:plistPath2];
    
    self.provinceComponentArray = [NSMutableArray array];
    [self.provinceComponentArray addObject:[self.allProvinces allKeys]];
    [self onProvinceSelectd:0 row:0];
    
    [self notifyToRefresh];
}

-(void)onCitySelected:(NSInteger)component row:(NSInteger)row{
    NSArray *cityArray = [self.cityComponentArray safeObjectAtIndex:component];
    NSString *city = [cityArray safeObjectAtIndex:row];
    [AJUtil toast:city];
}

-(void)onProvinceSelectd:(NSInteger)componet row:(NSInteger)row{
    if (componet == 0) {
        NSArray *provinceArray = [self.provinceComponentArray firstObject];
        self.selectedProvince = [provinceArray safeObjectAtIndex:row];
        NSArray *cityArray = [self.allProvinces safeObjectFortKey:self.selectedProvince];
        self.selectedCity = [cityArray safeObjectAtIndex:0];
        [self.provinceComponentArray removeAllObjects];
        [self.provinceComponentArray addObject:provinceArray];
        [self.provinceComponentArray addObject:cityArray];
    }else{
        NSArray *cityArray = [self.provinceComponentArray lastObject];
        self.selectedCity = [cityArray safeObjectAtIndex:row];
    }
    [AJUtil toast:[NSString stringWithFormat:@"%@, %@", self.selectedProvince, self.selectedCity]];
}


@end
