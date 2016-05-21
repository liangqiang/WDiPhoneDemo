//
//  Y022ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y022ViewModel : YScrollViewModel

@property (nonatomic, strong) UIImage* loadImage;   //下载后显示image
@property (nonatomic, assign) NSInteger ticketCount; //票总数
@property (nonatomic, assign) NSInteger sellTickets; //卖出票数量
@property (nonatomic, strong) NSThread *ticketsThreadOne;    //线程1
@property (nonatomic, strong) NSThread *ticketsThreadTwo;    //线程2
@property (nonatomic, strong) NSLock *theLock;  //一个锁对象

-(void)startLoadImage1:(NSString*)url;

-(void)startLoadImage2:(NSString*)url;

-(void)startTicked;

-(void)startNSOperatorBlock:(NSString*)url;

-(void)startNSOperationQueue:(NSString*)url;

@end
