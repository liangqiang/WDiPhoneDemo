//
//  Y020ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y020ViewModel.h"

@implementation Y020ViewModel

-(void)loadData{
    
    self.viewTypeArray = @[VIEWTYPE(@"AsyncDownLoadNormal", @"使用NSURLConnection创建异步下载请求"),
                           VIEWTYPE(@"AsyncUpdateNormal", @"使用NSURLConnection创建异步上传请求"),
                           VIEWTYPE(@"AsyncDownLoadNormal2", @"sendAsynchronousRequest方法创建异步下载请求"),
                           VIEWTYPE(@"SyncDownLoadNormal2", @"sendSynchronousRequest方法创建同步下载请求"),
                           VIEWTYPE(@"AsyncUpdateNormal2", @"sendAsynchronousRequest方法创建异步上传请求"),
                           VIEWTYPE(@"SyncUpdateNormal2", @"sendSynchronousRequest方法创建同步上传请求"),
                           ];
    [self notifyToRefresh];
}


-(void)AsyncDownLoadNormal{
    //下载数据URL
    NSURL *url = [NSURL URLWithString:@"http://172.16.10.2:8080/service/uploadusernote?user_name=neworigin"];  //创建请求对象
    NSURLRequest *reqest = [NSURLRequest requestWithURL:url];  //创建URLConnection对象,并设置当前类的对象为代理
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:reqest
                                                                 delegate:self];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [AJUtil toast:@"下载失败"];
}
//请求得到响应时调 ,在此 法中将_mutableData清空
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [self.mutableData setData:[NSData data]];
}
//接收到数据时调 ,并将接收到的data追加到_mutableData中
-  (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.mutableData appendData:data];
}
//请求完成后,将_mutableData转成字符串并显 在textView中
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString* str = [[NSString alloc]initWithData:_mutableData encoding:NSUTF8StringEncoding];
    [AJUtil toast:str];
}



-(void)AsyncUpdateNormal{
    NSString *userName = @"neworigin";
    //需上传的内容
    NSString *content = @"我是要上传的内容";
    NSData *postData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:@"http://172.16.10.2:8080/service/downloadusernote?user_name=neworigin"];
    NSMutableURLRequest *reqest = [NSMutableURLRequest requestWithURL:url];
    [reqest setHTTPBody:postData];//设置请求体,即要上传的内容
    [reqest setHTTPMethod:@"POST"];//设置请求 法为POST
    [reqest setValue:[NSString stringWithFormat:@"%d",postData.length]
  forHTTPHeaderField:@"Content-Length"];//设置http头
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:reqest
                                                                 delegate:self];
}



-(void)AsyncDownLoadNormal2{
    
    NSURL *url = [NSURL URLWithString:@"http://172.16.10.2:8080/service/uploadusernote?user_name=neworigin"];  //创建请求对象
    NSURLRequest *reqest = [NSURLRequest requestWithURL:url];
    NSOperationQueue* queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:reqest queue:queue
    completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (!connectionError) {
            NSString* str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            [AJUtil toast:str];
        }
    }];
}



-(void)SyncDownLoadNormal2{
    NSURL *url = [NSURL URLWithString:@"http://172.16.10.2:8080/service/uploadusernote?user_name=neworigin"];  //创建请求对象
    NSURLRequest *reqest = [NSURLRequest requestWithURL:url];
    NSData* data = [NSURLConnection sendSynchronousRequest:reqest returningResponse:nil  error:nil];
    NSString* str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    [AJUtil toast:str];
}



-(void)AsyncUpdateNormal2{
    
    NSString *content = @"我是要上传的内容";
    NSData *postData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:@"http://172.16.10.2:8080/service/downloadusernote?user_name=neworigin"];
    NSMutableURLRequest *reqest = [NSMutableURLRequest requestWithURL:url];
    [reqest setHTTPBody:postData];//设置请求体,即要上传的内容
    [reqest setHTTPMethod:@"POST"];//设置请求 法为POST
    [reqest setValue:[NSString stringWithFormat:@"%d",postData.length]
  forHTTPHeaderField:@"Content-Length"];//设置http头
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:reqest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {  if (!connectionError) {
        NSString* str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        [AJUtil toast:str];
    }
    }];
}



-(void)SyncUpdateNormal2{
    NSString *content = @"我是要上传的内容";
    NSData *postData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:@"http://172.16.10.2:8080/service/downloadusernote?user_name=neworigin"];
    NSMutableURLRequest *reqest = [NSMutableURLRequest requestWithURL:url];
    [reqest setHTTPBody:postData];//设置请求体,即要上传的内容
    [reqest setHTTPMethod:@"POST"];//设置请求 法为POST
    [reqest setValue:[NSString stringWithFormat:@"%d",postData.length]
  forHTTPHeaderField:@"Content-Length"];//设置http头
    NSData* data = [NSURLConnection sendSynchronousRequest:reqest returningResponse:nil error:nil];
    NSString* str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    [AJUtil toast:str];
}

@end
