//
//  AJTableViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/5/6.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

typedef enum {
    ELoadNotStart,
    ELoadding,
    ELoadFailed,
    ELoadDone,
} ELoadState;

@interface AJTableViewModel : AJViewModel

// 列表数据
@property (nonatomic,strong) NSMutableArray *sectionArray; // AJSectionItem
@property (nonatomic,assign) NSInteger pageIndex; // 当前页数（数据已完成加载的）
@property (nonatomic,assign) BOOL hasMore; // 是否有加载下一页

// 通常用于加载网络数据的状态
@property (nonatomic,assign) ELoadState loadState; //加载状态

@end
