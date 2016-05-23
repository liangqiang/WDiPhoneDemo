//
//  Y022ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y022ViewModel.h"

@implementation Y022ViewModel

- (void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"ShowImage", @"用来显示在子线程中填充的图片"),
                           VIEWTYPE(@"ThreadNormal1", @"使用NSthread类方法"),
                           VIEWTYPE(@"ThreadNormal2", @"使用NSthread实例方法"),
                           VIEWTYPE(@"ThreadTicked", @"NSThread多线程卖票系统"),
                           VIEWTYPE(@"BlockOperation", @"NSBlockOperation同步线程"),
                           VIEWTYPE(@"OperationQueue", @"NSOperationQueue队列线程"),
                           VIEWTYPE(@"GCDNormal", @"GCD基本数据下载使用"),
                           VIEWTYPE(@"GCDQueue", @"GCD异步队列"),
                           ];
    
    self.ticketCount = 15;
    self.sellTickets = 0;
    
    [self notifyToRefresh];
}

#pragma mark NSThread
-(void)startLoadImage1:(NSString*)url{
    [NSThread detachNewThreadSelector:@selector(downloadImage:) toTarget:self withObject:url];
}

-(void)startLoadImage2:(NSString*)url{
    NSThread* thread = [[NSThread alloc]initWithTarget:self selector:@selector(downloadImage:) object:url];
    [thread start];
}

-(void)downloadImage:(NSString*)url{
    //把下载的内容转换成data格式
    NSData* data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
    //把获得的data转化成image
    UIImage* image = [[UIImage alloc]initWithData:data];
    if(image==nil){
        [AJUtil toast:@"图片下载失败"];
    }else{
        //子线程结束通知主线程更新UI
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
    }
}
-(void)updateUI:(UIImage*)image{
    self.loadImage = image;
    [self notifyToRefresh];
}


#pragma mark Tickets
-(void)startTicked{
    self.theLock = [[NSLock alloc]init];
    
    self.ticketsThreadOne = [[NSThread alloc]initWithTarget:self selector:@selector(toSellTicket) object:nil];
    [self.ticketsThreadOne setName:@"Thread-1"];
    [self.ticketsThreadOne start];
    
    self.ticketsThreadTwo = [[NSThread alloc] initWithTarget:self selector:@selector(toSellTicket) object:nil];
    [self.ticketsThreadTwo setName:@"Thread-2"];
    [self.ticketsThreadTwo start];
}

-(void)toSellTicket{
    while (TRUE) {
        //上锁
        [self.theLock lock];
        if(self.ticketCount > 0){
            [NSThread sleepForTimeInterval:3];
            self.ticketCount--;
            self.sellTickets = 15 - self.ticketCount;
            NSString *showStr = [NSString stringWithFormat:@"%@卖出一张票，共售出%d张票",[[NSThread currentThread] name],self.sellTickets];
            [self performSelectorOnMainThread:@selector(updateTickets:) withObject:showStr waitUntilDone:YES];
        }
        else{
            break;
        }
        [self.theLock unlock];
    }
}
-(void)updateTickets:(NSString*)str{
    [AJUtil toast:str];
}


#pragma mark NSoperatorBlock
-(void)startNSOperatorBlock:(NSString*)url{
    NSBlockOperation* operation = [NSBlockOperation blockOperationWithBlock:^{
        [self downloadImage:url];
    }];
    [operation setCompletionBlock:^{
        
    }];
    [operation start];//当前线程同步操作,并没有异步执 ,阻塞主线程。
}

#pragma mark NSOperationQueue
-(void)startNSOperationQueue:(NSString*)url{
    NSBlockOperation* operation = [NSBlockOperation blockOperationWithBlock:^{
        [self downloadImage:url];  }];
    [operation setCompletionBlock:^{
        
    }];
    
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:operation]; //加到队列中的线程会立即执行(异步)
    [queue setMaxConcurrentOperationCount:1];//设置同时并发线程数量
    //[queue setSuspended:YES];//暂停队列
}

#pragma mark GCD
-(void)startGCDNormal:(NSString*)url{
    //DISPATCH_QUEUE_PRIORITY_DEFAULT 优先级
    //0 这个值留着将来使用
    //dispatch_async就是开启一个普通的多线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //耗时操作
        NSURL * url = [NSURL URLWithString:kURL];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                //更新界面
                self.loadImage = image;
                [self notifyToRefresh];
            });
        }
    });
}

-(void)startGCDQueue{
    //创建队列(暂时为空)
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建一组(暂时为空)
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:5];
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:2];
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [AJUtil toast:@"终于轮到我了"];
    });
}

@end
