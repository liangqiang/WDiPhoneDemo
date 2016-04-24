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
    self.viewTypeArray = @[VIEWTYPE( @"TextViewMessage", @"多行文本框(不超过100字，提示语，剩余字数)"),
                           VIEWTYPE( @"TextViewReadOnly", @"多行文本框(只读显示)"),
                           ];
    
    [self notifyToRefresh];
}

-(BOOL)submit{
    NSString *message = [self messageCheckValid];
    if (message) {
        [AJUtil toast:message];
        return NO;
    }else{
        [AJUtil toast:[NSString stringWithFormat:@"%@\n提交成功", self.content]];
        return YES;
    }
}

-(NSString*)messageCheckValid{
    if (self.content.length == 0) {
        return @"请输入提交信息";
    }
    return nil;
}

@end
