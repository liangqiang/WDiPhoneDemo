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
                           
                           VIEWTYPE(@"AsyncUpdateNormal2", @"sendAsynchronousRequest方法创建异步上传请求"),
                           
                           ];
    [self notifyToRefresh];
}


//异步下载数据
-(void)AsyncDownLoadNormal{
    self.mutableData = [[NSMutableData alloc] init];
    //下载数据URL
    NSURL *url = [NSURL URLWithString:@"http://172.16.10.2:8080/service/downloadusernote?user_name=neworigin1"];  //创建请求对象
    NSURLRequest *reqest = [NSURLRequest requestWithURL:url];  //创建URLConnection对象,并设置当前类的对象为代理
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:reqest delegate:self];
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



//异步上传数据
-(void)AsyncUpdateNormal{
    self.mutableData = [[NSMutableData alloc] init];
    //需上传的内容
    NSString *content = @"我是要上传的内容";
    NSData *postData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:@"http://172.16.10.2:8080/service/uploadusernote?user_name=neworigin1"];
    NSMutableURLRequest *reqest = [NSMutableURLRequest requestWithURL:url];
    [reqest setHTTPBody:postData];//设置请求体,即要上传的内容
    [reqest setHTTPMethod:@"POST"];//设置请求 法为POST
    [reqest setValue:[NSString stringWithFormat:@"%d",postData.length]
  forHTTPHeaderField:@"Content-Length"];//设置http头
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:reqest
                                                                 delegate:self];
}



-(void)AsyncDownLoadNormal2{
    NSString *urlString = [NSString stringWithFormat:@"http://172.16.10.2:8080/service/downloadusernote?user_name=neworigin1"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    // session发送网络请求对象
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString* str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"...%@",str);
    }];
    //开始网络请求任务
    [task resume];
}

-(void)AsyncUpdateNormal2{
    
    NSString *urlString = [NSString stringWithFormat:@"http://172.16.10.2:8080/service/uploadusernote?user_name=neworigin1"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSString *bodyStr = @"需要发送的字符串";
    NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    // session发送网络请求对象
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString* str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"...%@",str);
    }];
    //开始网络请求任务
    [task resume];
}

@end
