//
//  Y011ViewModel3.m
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewModel3.h"

@implementation Y011ViewModel3

-(void)loadData{
    
    self.viewTypeArray = @[VIEWTYPE(@"PickerViewCustom", @"基本滚动视图、cell宽、高、自定义cell"),
                           ];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Y011City1" ofType:@"plist"];
    self.cityArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    
    [self notifyToRefresh];
}

-(void)onPickerViewSelected:(NSString*)msg{

}

@end
