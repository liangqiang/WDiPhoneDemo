//
//  Y020ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y020ViewController.h"
#import "Y020ViewModel.h"

@interface Y020ViewController ()
@property (nonatomic, strong) Y020ViewModel *viewModel;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation Y020ViewController

//1、使用NSURLConnection创建异步下载请求
-(UIButton*)createAsyncDownLoadNormal{
    WEAKSELF
    return [self createButtonWithTitle:@"开始" block:^(UIControl *control) {
        [weakSelf.viewModel AsyncDownLoadNormal];
    }];
}

//2、使用NSURLConnection创建异步上传请求
-(UIButton*)createAsyncUpdateNormal{
    WEAKSELF
    return [self createButtonWithTitle:@"开始" block:^(UIControl *control) {
        [weakSelf.viewModel AsyncUpdateNormal];
    }];
}

//3、sendAsynchronousRequest方法创建异步下载请求
-(UIButton*)createAsyncDownLoadNormal2{
    WEAKSELF
    return [self createButtonWithTitle:@"开始" block:^(UIControl *control) {
        [weakSelf.viewModel AsyncDownLoadNormal2];
    }];
}

//4、sendSynchronousRequest方法创建同步下载请求
-(UIButton*)createSyncDownLoadNormal2{
    WEAKSELF
    return [self createButtonWithTitle:@"开始" block:^(UIControl *control) {
        //[weakSelf.viewModel createFMDBDelete];
    }];
}

//5、sendAsynchronousRequest方法创建异步上传请求
-(UIButton*)createAsyncUpdateNormal2{
    WEAKSELF
    return [self createButtonWithTitle:@"开始" block:^(UIControl *control) {
        //[weakSelf.viewModel createFMDBDelete];
    }];
}

//6、sendSynchronousRequest方法创建同步上传请求
-(UIButton*)createSyncUpdateNormal2{
    WEAKSELF
    return [self createButtonWithTitle:@"开始" block:^(UIControl *control) {
        //[weakSelf.viewModel createFMDBDelete];
    }];
}


#pragma mark -
-(UIButton*)createButtonWithTitle:(NSString*)title block:(UIControlEventBlock)block{
    UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, title, nil];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    button.backgroundColor = kWhiteColor;
    [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
    
    //添加按钮的触摸事件(按钮按下)
    [button handleEvent:UIControlEventTouchUpInside withBlock:block];
    
    return button;
}
@end
