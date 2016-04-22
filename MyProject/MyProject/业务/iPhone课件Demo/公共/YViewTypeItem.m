//
//  YViewTypeItem.m
//  MyProject
//
//  Created by liangqiang on 16/4/22.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YViewTypeItem.h"

@implementation YViewTypeItem

@end

YViewTypeItem *VIEWTYPE(NSString *viewType, NSString *hint){
    YViewTypeItem *item = [YViewTypeItem new];
    item.viewType = viewType;
    item.hint = hint;
    return item;
}