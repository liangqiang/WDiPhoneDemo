//
//  Y017ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/13.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017ViewModel.h"

@implementation Y017ViewModel

-(void)loadData{
    
    NSString *bundleFile = [[NSBundle mainBundle] pathForResource: @"Y017friendList" ofType: @"plist"];
    NSDictionary *friendDic = [NSDictionary dictionaryWithContentsOfFile:bundleFile];
    self.sectionArray = [[NSMutableArray alloc] initWithArray:[friendDic allKeys]];
    self.allFriendArray = [[NSMutableArray alloc] initWithArray:[friendDic allValues]];
    
    [self notifyToRefresh];
}

// 一共有多少个区域
-(NSInteger)sectionCount{
    return self.sectionArray.count;
}
//每个区域有多少个好友
-(NSInteger)friendCountAtSection:(NSInteger)section{
    NSArray *friendCountAtSection = [self.allFriendArray safeObjectAtIndex:section];
    return [friendCountAtSection count];
}
//每个好友的标题
-(NSString*)friendAtSection:(NSInteger)section row:(NSInteger)row{
    NSArray *friendArray = [self.allFriendArray safeObjectAtIndex:section];
    NSString *friendName = [friendArray safeObjectAtIndex:row];
    return friendName;
}
//每个分组的标题
-(NSString*)titleSection:(NSInteger)section{
    NSString *titleAtSection = [self.sectionArray safeObjectAtIndex:section];
    return titleAtSection;
}
//分组是否打开
-(BOOL)isOpenAtSection:(NSInteger)section{
    if([self.showDic objectForKey:[NSString stringWithFormat:@"%d",section]]){
        return YES;
    }else{
        return NO;
    }
}
//设置分组打开
-(void)changeShowDic:(NSInteger)section{
    if(!self.showDic){
        self.showDic = [[NSMutableDictionary alloc] init];
    }
    
    NSString *key = [NSString stringWithFormat:@"%d",section];
    if(![self.showDic objectForKey:key]){
        [self.showDic setObject:@"1" forKey:key];
    }else{
        [self.showDic removeObjectForKey:key];
    }

}


@end
