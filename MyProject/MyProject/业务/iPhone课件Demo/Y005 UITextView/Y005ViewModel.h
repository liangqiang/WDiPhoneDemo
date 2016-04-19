//
//  Y005ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/19.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y005ViewModel : AJViewModel

@property(nonatomic,strong)NSArray *viewTypeArray;
@property(nonatomic,strong)NSString *message;

-(void)loadData;
-(BOOL)checkValid;
-(void)submit;

@end
