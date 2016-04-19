//
//  Y005ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/19.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y005ViewModel.h"

@implementation Y005ViewModel

-(void)loadData{
    NSArray *array = @[@"TextViewMessage",@"TextViewMessage2"];
    
    self.viewTypeArray = [NSMutableArray arrayWithArray:array];
    
    [self notifyToRefresh];
}

-(BOOL)checkValid{
    NSString *messsage = [self messageCheckValid];
    if (messsage) {
        [AJUtil toast:messsage];
        return NO;
    }else{
        return YES;
    }
}

-(NSString*)checkMessage{
    self.message = [self.message substringToIndex:4];
    return self.message;
}

-(NSString*)messageCheckValid{
    if (self.message.length == 0) {
        return @"请输入提交信息";
    }
    return nil;
}

-(void)submit{
    [AJUtil toast:@"提交成功"];
}

@end
