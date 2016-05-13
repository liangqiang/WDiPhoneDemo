//
//  Y016ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y016ViewModel : YScrollViewModel

@property (nonatomic, strong) NSMutableArray *imageArray;

-(UIImage*)imageSelected:(NSInteger)index;

@end
