//
//  Y017_1MessageModel.h
//  MyProject
//
//  Created by caoyang on 16/5/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Y017_1MessageModel : NSObject

typedef enum {
    kMessageModelTypeOther,
    kMessageModelTypeMe
} MessageModelType;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, assign) MessageModelType type;
@property (nonatomic, assign) BOOL showTime;

+ (id)messageModelWithDict:(NSDictionary *)dict;

@end
