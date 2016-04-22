//
//  YScrollViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/4/22.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"
#import "YViewTypeItem.h"

@interface YScrollViewModel : AJViewModel

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSArray *viewTypeArray; // YViewTypeItem

-(void)loadData;

@end
