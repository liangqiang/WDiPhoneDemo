//
//  Y004ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/18.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y004ViewModel.h"

@implementation Y004ViewModel

-(void)loadData{
    
    NSArray *array = @[@"ImageViewSimple",@"ImageViewTouch",@"ImageViewGif"];
    
    self.viewTypeArray = [NSMutableArray arrayWithArray:array];
    
    [self notifyToRefresh];
}

-(void)onImageClicked:(NSString*)sender{
    [AJUtil toast:sender];
}

@end
