//
//  Y007ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y007ViewModel.h"

@implementation Y007ViewModel

-(void)loadData{
    NSArray *array = @[@"SliderNormal",@"SliderMaxMinValue",@"SliderMaxColorMinColor",@"SliderHightLighted"];
    
    self.viewTypeArray = [NSMutableArray arrayWithArray:array];
    
    [self notifyToRefresh];
}

-(void)onSliderValueChanged{
    
    [AJUtil toast:[self converToString]];
}

-(NSString*)converToString{
    NSString *strValue = [NSString stringWithFormat:@"%f",self.sliderValue];
    return strValue;
}

@end
