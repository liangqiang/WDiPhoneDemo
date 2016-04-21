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

@property(nonatomic,strong) Y005ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UITextView *textViewMessage;

@end

@implementation Y005ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Y005 UITextView";
    [self.rightNaviButton setTitle:@"提交" forState:UIControlStateNormal];
    WEAKSELF
    [self.rightNaviButton handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *controle){
        [weakSelf submit];
    }];
    
    self.scrollView = [self createScrollView];
    [self.view addSubview:self.scrollView];
    
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [self.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.scrollView removeAllSections];
    for (NSString *viewType in self.viewModel.viewTypeArray) {
        UIView *hintSection = [self createHintSectionWithViewType:viewType];
        [self.scrollView addSection:hintSection];
        
        UIView *section = [UIView newWith:[UIColor clearColor], nil];
        NSString *selector = [NSString stringWithFormat:@"create%@", viewType];
        UIView *subview = [AJUtil performReturnSelector:NSSelectorFromString(selector) onTarget:self];
        
        [section addSubview:subview];
        section.size = CGSizeMake(self.scrollView.width, subview.height + 20);
        [subview layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, EAuto, EAuto)]; // 定位
        
        [self.scrollView addSection:section];
    }
}

-(UIView*)createHintSectionWithViewType:(NSString*)viewType{
    NSDictionary *dict = @{@"TextViewMessage": @"多行文本框(文本长度不超过100字)",
                           @"TextViewMessage2":@"多行文本框(不可进行编辑)"
                           };
    NSString *hint = [dict safeObjectFortKey:viewType];
    
    UILabel *label = [UILabel newWith: kFont12, kLightBlackColor, hint, nil];
    [label sizeToFit];
    
    UIView *section = [UIView newWith:[UIColor clearColor], nil];
    [section addSubview:label];
    section.size = CGSizeMake(self.scrollView.width, label.height + 10);
    [label layoutWithInsets:UIEdgeInsetsMake(EAuto, 15, EAuto, EAuto)]; // 定位
    
    return section;
}

//多行文本框、字体大小、键盘类型、键盘返回样式、用户交互、滚动、键盘退出。
-(UITextView*)createTextViewMessage{
    
    UITextView *textView = [UITextView new];
    textView.size = CGSizeMake(self.view.width-30, 100);
    textView.font = kFont14;
    textView.backgroundColor = kWhiteColor;
    textView.returnKeyType = UIReturnKeyDone;
    textView.keyboardType = UIKeyboardAppearanceDefault;
    textView.showsVerticalScrollIndicator = YES;
    textView.delegate = self;
    self.textViewMessage = textView;
    return textView;
}

//多行文本框、字体大小、键盘类型、键盘返回样式、用户交互、滚动、键盘退出。
-(UITextView*)createTextViewMessage2{
    UITextView *textView = [UITextView new];
    textView.size = CGSizeMake(self.view.width-30, 100);
    textView.font = kFont14;
    [textView setEditable:NO];
    [textView setBackgroundColor:kWhiteColor];
    textView.text = @"很长的一段文字，用来查看不可以进行编辑、这个和楠哥，是不是一个东西。好长好长好吓人,今天是个什么日子呢，我也不直掉，反正今天晚上我还要上课，并且不知道怎么上课啊，学生是大一的，还要求做一个什么什么游戏，什么什么应用的，这个好苦难啊,你说她们能不能做出来哇，我是不知道，没有学过任何语言怎么做啊，做什么做";
    return textView;
}

#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    [self submit];
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(textView.text.length>=5){
        self.viewModel.message = textView.text;
        textView.text = [self.viewModel checkMessage];
    }
    return YES;
}

-(void)submit{
    [self.view endEditing:YES]; //收起键盘
    self.viewModel.message = self.textViewMessage.text;
    if ([self.viewModel checkValid]) {
        [self.viewModel submit];
    }
}



@end
