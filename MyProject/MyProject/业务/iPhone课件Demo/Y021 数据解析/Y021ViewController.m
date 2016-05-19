//
//  Y021ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y021ViewController.h"
#import "Y021ViewModel.h"

@interface Y021ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) Y021ViewModel *viewModel;
@end

@implementation Y021ViewController

- (UIButton*) createXMLNormal{
    WEAKSELF
    return [self createButtonWithTitle:@"XML数据解析" block:^(UIControl *control) {
        [weakSelf.viewModel onXMLParse];
    }];
}

- (UIButton*) createJsonNormal{
    WEAKSELF
    return [self createButtonWithTitle:@"Json数据解析" block:^(UIControl *control) {
        [weakSelf.viewModel onJsonParse];
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
