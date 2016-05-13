//
//  Y017ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/13.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJTableViewModel.h"

@interface Y017ViewModel : AJViewModel

@property (nonatomic, strong) NSMutableArray *sectionArray; //好友分组
@property (nonatomic, strong) NSMutableArray *allFriendArray;     //组内好友
@property (nonatomic, strong) NSMutableDictionary *showDic; //是否分开好友

-(void)loadData;

-(NSInteger)sectionCount;

-(NSInteger)friendCountAtSection:(NSInteger)section;

-(NSString*)friendAtSection:(NSInteger)section row:(NSInteger)row;

-(NSString*)titleSection:(NSInteger)section;

-(BOOL)isOpenAtSection:(NSInteger)section;

-(void)changeShowDic:(NSInteger)section;

-(void)onItemClicked:(NSIndexPath*)indexPath;

@end
