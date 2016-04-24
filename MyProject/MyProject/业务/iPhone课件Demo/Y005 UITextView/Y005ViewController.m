//
//  Y005ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/19.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y005ViewController.h"
#import "Y005ViewModel.h"

@interface Y005ViewController ()<UITextViewDelegate>

@property (nonatomic,strong) Y005ViewModel *viewModel;
@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UITextView *contentTextView;
@property (nonatomic,strong) UILabel *placeHolderLabel;
@property (nonatomic,strong) UILabel *countLabel;
@end

@implementation Y005ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rightNaviButton setTitle:@"提交" forState:UIControlStateNormal];
    WEAKSELF
    [self.rightNaviButton handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *controle){
        [weakSelf submit];
    }];
}


//多行文本框、字体大小、键盘类型、键盘返回样式、用户交互、滚动、键盘退出。
-(UITextView*)createTextViewMessage{
    
    UITextView *textView = [UITextView new];
    textView.size = CGSizeMake(self.view.width-30, 100);
    textView.font = kFont14;
    textView.backgroundColor = kWhiteColor;
    textView.keyboardType = UIKeyboardAppearanceDefault;
    textView.showsVerticalScrollIndicator = YES;
    textView.delegate = self;
    
    // 提示语
    self.placeHolderLabel = [UILabel newWith:kFont14, kGrayColor, @"请详细说明您遇到的困难和问题", nil];
    [self.placeHolderLabel sizeToFit];
    [textView addSubview:self.placeHolderLabel];
    [self.placeHolderLabel layoutWithInsets:UIEdgeInsetsMake(8, 5, EAuto, EAuto)];

    // 添加剩余字数
    self.countLabel = [UILabel newWith:kFont12, kGrayColor, @"", @(NSTextAlignmentRight), nil];
    self.countLabel.size = CGSizeMake(50, 20);
    [textView addSubview:self.countLabel];
    [self.countLabel layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, 0, 0)];
    [self updateCountLabel];
    
    self.contentTextView = textView;
    return textView;
}

-(void)updateCountLabel{
    NSInteger count = 100 - self.contentTextView.text.length;
    self.countLabel.text = [NSString stringWithFormat:@"%zd", count];
}

//多行文本框、字体大小、键盘类型、键盘返回样式、用户交互、滚动、键盘退出。
-(UITextView*)createTextViewReadOnly{
    UITextView *textView = [UITextView new];
    textView.size = CGSizeMake(self.view.width-30, 100);
    textView.font = kFont14;
    [textView setEditable:NO];
    [textView setBackgroundColor:kWhiteColor];
    textView.text = @"第一回 宴桃园豪杰三结义 斩黄巾英雄首立功 \n\n\
    滚滚长江东逝水，浪花淘尽英雄。是非成败转头空。青山依旧在，几度夕阳红。白发渔樵江渚上，惯看秋月春风。一壶浊酒喜相逢。古今多少事，都付笑谈中。\n\n\
    话说天下大势，分久必合，合久必分：周末七国分争，并入于秦；及秦灭之后，楚、汉分争，又并入于汉；汉朝自高祖斩白蛇而起义，一统天下，后来光武中兴，传至献帝，遂分为三国";
    return textView;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    [AJUtil textView:textView limitMaxLength:100];
    self.placeHolderLabel.hidden = (self.contentTextView.text.length>0);
    [self updateCountLabel];
}

-(void)submit{
    [self.view endEditing:YES]; //收起键盘
    self.viewModel.content = self.contentTextView.text;
    [self.viewModel submit];
}



@end
