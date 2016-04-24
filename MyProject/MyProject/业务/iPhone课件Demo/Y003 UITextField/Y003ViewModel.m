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
    self.viewTypeArray = @[VIEWTYPE( @"TextFieldName", @"文本框（提示语，字体）"),
                           VIEWTYPE( @"TextFieldPassword", @"文本框（密码，圆角，边框）"),
                           VIEWTYPE( @"TextFieldPhone", @"文本框（限制长度，检查输入合法）"),
                           ];
    
    [self notifyToRefresh];
}

-(BOOL)submit{
    NSString *message = [self messageCheckValid];
    if (message) {
        [AJUtil toast:message];
        return NO;
    }else{
        [AJUtil toast:@"提交成功"];
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

@end
