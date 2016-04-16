//
//  Y003ViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y003ViewModel.h"

@implementation Y003ViewModel

-(void)loadData{
    NSArray *array = @[@"TextFieldName", @"TextFieldPassword", @"TextFieldPhone"];
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

-(NSString*)messageCheckValid{
    if (self.name.length == 0) {
        return @"请输入姓名";
    }
    if (self.password.length == 0) {
        return @"请输入密码";
    }
    if (self.phone.length == 0) {
        return @"手机号不能为空";
    }
    if (self.phone.length != 11) {
        return @"手机号必须为11位";
    }
    return nil;
}

-(void)submit{
    [AJUtil toast:@"提交成功"];
}


@end
