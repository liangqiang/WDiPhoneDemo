//
//  Y001ViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y001ViewModel.h"

@implementation Y001ViewModel

-(void)loadData{
    NSArray *array = @[@"ButtonSimple", @"ButtonHighlighted", @"ButtonDisabled",
                       @"ButtonSelected", @"ButtonImage"];
    self.viewTypeArray = [NSMutableArray arrayWithArray:array];
    
    [self notifyToRefresh];
}

-(void)onButtonClicked:(UIButton*)button{
    [AJUtil toast:button.titleLabel.text];
}

@end
