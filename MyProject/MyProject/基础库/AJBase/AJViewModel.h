//
//  AJViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/4/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJViewModel : NSObject

@property (nonatomic,weak) id holder;
@property (nonatomic,copy) AJVoidBlock refreshBlock;

-(void)setRefreshBlock:(AJVoidBlock)refreshBlock;
-(void)notifyToRefresh;

@end

