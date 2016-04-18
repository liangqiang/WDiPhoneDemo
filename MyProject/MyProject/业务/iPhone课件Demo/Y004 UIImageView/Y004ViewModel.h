//
//  Y004ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/4/18.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface Y004ViewModel : AJViewModel

@property(nonatomic,strong) NSArray *viewTypeArray;

-(void)loadData;
-(void)onImageClicked:(NSString*)sender;
@end
