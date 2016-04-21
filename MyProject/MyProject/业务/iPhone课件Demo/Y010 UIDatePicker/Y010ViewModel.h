//
//  Y010ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y010ViewModel : AJViewModel

@property(nonatomic,strong)NSArray *viewTypeArray;
@property(nonatomic,strong)NSString *dateMessage;

-(void)loadData;

-(void)submit;

@end
