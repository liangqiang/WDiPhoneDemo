//
//  Y008ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y008ViewModel : YScrollViewModel

@property(nonatomic,strong) NSString *userName;
@property(nonatomic,strong) NSString *passWord;

-(void)onAlertViewClicked:(NSString*)message;

-(BOOL)checkLength:(NSString*)sender;

@end
