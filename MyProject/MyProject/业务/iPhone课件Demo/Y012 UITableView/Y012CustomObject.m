//
//  Y012CustomObject.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012CustomObject.h"

@implementation Y012CustomObject

-(instancetype)initWithDictionary:(NSDictionary*)dic{
    if(self = [super init]){
        self.name = [dic objectForKey:@"name"];
        self.sex = [dic objectForKey:@"sex"];
        self.enjoy = [dic objectForKey:@"enjoy"];
    }
    
    return self;
}

@end
