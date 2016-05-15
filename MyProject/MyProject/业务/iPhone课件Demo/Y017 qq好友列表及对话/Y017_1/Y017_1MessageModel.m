//
//  Y017_1MessageModel.m
//  MyProject
//
//  Created by caoyang on 16/5/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017_1MessageModel.h"

@implementation Y017_1MessageModel

+ (id)messageModelWithDict:(NSDictionary *)dict
{
    Y017_1MessageModel *message = [[self alloc] init];
    message.text = dict[@"text"];
    message.time = dict[@"time"];
    message.type = [dict[@"type"] intValue];
    
    return message;
}

@end
