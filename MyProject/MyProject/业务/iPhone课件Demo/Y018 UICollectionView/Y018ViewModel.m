//
//  Y018ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/12.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y018ViewModel.h"

@implementation Y018ViewModel

-(void)loadData{
    
    self.hArr = [[NSMutableArray alloc] init];
    
    for (int i=0; i<20; i++) {
        CGFloat height=100+(arc4random()%120);
        [self.hArr addObject:[NSString stringWithFormat:@"%f",height]];
    }
    
    [self notifyToRefresh];
}

-(NSInteger)collCount{
    return [self.hArr count];
}

-(float)itemHeight:(NSInteger)row{
    return [[self.hArr safeObjectAtIndex:row] floatValue];
}

@end
