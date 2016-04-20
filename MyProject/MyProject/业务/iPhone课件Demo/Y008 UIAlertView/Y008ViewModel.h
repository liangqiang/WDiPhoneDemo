//
//  Y008ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y008ViewModel : AJViewModel

@property(nonatomic,strong) NSArray *viewTypeArray;
@property(nonatomic,strong) NSString *clickMessage;

@property(nonatomic,strong) NSString *userName;
@property(nonatomic,strong) NSString *passWord;

-(void)loadData;

-(void)submit;

-(BOOL)checkLength:(NSString*)sender;

@end
