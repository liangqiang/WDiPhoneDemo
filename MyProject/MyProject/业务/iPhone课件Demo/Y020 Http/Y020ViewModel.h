//
//  Y020ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y020ViewModel : YScrollViewModel<NSURLConnectionDelegate>

@property (nonatomic, strong) NSMutableData *mutableData;

-(void)AsyncDownLoadNormal;

-(void)AsyncUpdateNormal;

-(void)AsyncDownLoadNormal2;


-(void)AsyncUpdateNormal2;


@end
