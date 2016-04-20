//
//  Y008ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y008ViewModel.h"

@implementation Y008ViewModel

-(void)loadData{
    NSArray *array = @[@"AlertNormal",@"AlertList",@"AlertTextField"];
    
    self.viewTypeArray = [NSMutableArray arrayWithArray:array];
    
    [self notifyToRefresh];
}

-(void)submit{
    [AJUtil toast:self.clickMessage];
}

-(BOOL)checkLength:(NSString*)sender{
    if(sender.length>=8){
        return YES;
    }else{
        return NO;
    }
}

@end
