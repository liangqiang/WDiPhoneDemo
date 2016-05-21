//
//  Y022ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y022ViewController.h"
#import "Y022ViewModel.h"

@interface Y022ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) Y022ViewModel *viewModel;
@property (nonatomic, strong) UIImageView *showImageView;
@end

@implementation Y022ViewController

-(UIImageView*)createShowImage{
    UIImageView *imageView = [UIImageView new];
    imageView.size = CGSizeMake(self.scrollView.width - 200, self.scrollView.width - 200);
    imageView.backgroundColor = kLightGrayColor;
    imageView.clipsToBounds = YES;
    
    //设置图片原比例展示
    [imageView setContentMode:UIViewContentModeScaleAspectFit]; //缩放，维持长宽比
    
    WEAKSELF
    [imageView setImage:weakSelf.viewModel.loadImage];
    
    self.showImageView = imageView;
    return imageView;
}

//1、NSThread类方法
-(UIButton*) createThreadNormal1{
    WEAKSELF
    return [self createButtonWithTitle:@"NSthread类方法开启线程" block:^(UIControl *control) {
        [weakSelf.viewModel startLoadImage1:kURL];
    }];
}

//2、NSThread实例方法
-(UIButton*) createThreadNormal2{
    WEAKSELF
    return [self createButtonWithTitle:@"NSthread实例方法开启线程" block:^(UIControl *control) {
        [weakSelf.viewModel startLoadImage2:kURL];
    }];
}

//3、NSThread多线程卖票系统
-(UIButton*) createThreadTicked{
    WEAKSELF
    return [self createButtonWithTitle:@"NSThread多线程卖票系统" block:^(UIControl *control) {
        [weakSelf.viewModel startTicked];
    }];
}

//4、NSBlockOperation同步线程
-(UIButton*) createBlockOperation{
    WEAKSELF
    return [self createButtonWithTitle:@"NSBlockOperation开启线程" block:^(UIControl *control) {
        [weakSelf.viewModel startNSOperatorBlock:kURL];
    }];
}

//5、线程加入队列中NSOperationQueue
-(UIButton*) createOperationQueue{
    WEAKSELF
    return [self createButtonWithTitle:@"NSOperationQueue队列线程" block:^(UIControl *control) {
        [weakSelf.viewModel startNSOperationQueue:kURL];
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
