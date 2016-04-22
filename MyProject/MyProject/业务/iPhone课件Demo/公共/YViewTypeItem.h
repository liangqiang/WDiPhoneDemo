//
//  YViewTypeItem.h
//  MyProject
//
//  Created by liangqiang on 16/4/22.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YViewTypeItem : NSObject
@property (nonatomic,copy) NSString *viewType;
@property (nonatomic,copy) NSString *hint;
@end

YViewTypeItem *VIEWTYPE(NSString *viewType, NSString *hint);