//
//  Y016ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y016ViewModel.h"

@implementation Y016ViewModel

-(void)loadData{
    NSArray *imageArray = @[@"messageNormal.png",@"messageSelected.png",
                       @"dingNormal.png",@"dingSelected.png",
                       @"workNormal.png",@"workSelected.png",
                       @"friendNormal.png",@"friendSelected.png"];
    
    self.imageArray = [[NSMutableArray alloc] initWithArray:imageArray];
    
    [self notifyToRefresh];
}

-(UIImage*)imageSelected:(NSInteger)index{
    return [UIImage imageNamed:[self.imageArray safeObjectAtIndex:index]];
}

@end
