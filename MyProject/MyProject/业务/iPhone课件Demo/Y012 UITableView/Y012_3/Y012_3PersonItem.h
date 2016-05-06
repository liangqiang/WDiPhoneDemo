//
//  Y012CustomObject.h
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Y012_3PersonItem : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *enjoy;

-(instancetype)initWithDictionary:(NSDictionary*)dic;

@end
