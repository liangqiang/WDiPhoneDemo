//
//  Y012ViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/5/6.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012ViewModel.h"

@implementation Y012ViewModel

-(void)loadData{
    
    self.viewTypeArray = @[VIEWTYPE(@"TableViewNormal", @"基本表视图(Plain)"),
                           VIEWTYPE(@"TableViewGrouped", @"基本表视图(Grouped)"),
                           VIEWTYPE(@"TableViewCustom", @"表视图(自定义cell内容)"),
                           VIEWTYPE(@"TableViewFramework", @"表视图(阿剑框架)"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onViewTypeButtonClicked:(NSString*)viewType{
    NSDictionary *map = @{@"TableViewNormal": @"Y012_1ViewController",
                          @"TableViewGrouped": @"Y012_2ViewController",
                          @"TableViewCustom": @"Y012_3ViewController",
                          @"TableViewFramework": @"Y012_4ViewController",
                          };
    [AJNavi pushViewController:[map safeObjectFortKey:viewType]];
}

@end
