//
//  Y003ViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y003ViewModel : AJViewModel

@property (nonatomic,strong) NSArray *viewTypeArray;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *phone;


-(void)loadData;
-(BOOL)checkValid;
-(void)submit;
@end
