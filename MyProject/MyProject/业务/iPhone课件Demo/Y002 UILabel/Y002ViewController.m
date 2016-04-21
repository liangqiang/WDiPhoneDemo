//
//  Y002ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y002ViewController.h"
#import "Y002ViewModel.h"

@interface Y002ViewController ()
@property (nonatomic,strong) Y002ViewModel *viewModel;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation Y002ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = @"Y002 UILabel";

    self.scrollView = [self createScrollView];
    [self.view addSubview:self.scrollView];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.scrollView removeAllSections];
    for (NSString *viewType in self.viewModel.viewTypeArray) {
        UIView *section = [UIView newWith:[UIColor clearColor], nil];
        NSString *selector = [NSString stringWithFormat:@"create%@", viewType];
        UIView *subview = [AJUtil performReturnSelector:NSSelectorFromString(selector) onTarget:self];
        
        [section addSubview:subview];
        section.size = CGSizeMake(self.scrollView.width, subview.height + 20);
        [subview layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, EAuto, EAuto)]; // 定位
        
        [self.scrollView addSection:section];
    }
}

//1、	单行文本，设置文字、字体、颜色、对齐，截取方式
-(UILabel*)createLabelSingleLine{
    UILabel *label = [UILabel new];
    label.size = CGSizeMake(200, 30);
    label.text = @"单行（简单）";
    label.font = kFont14;
    return label;
}

//1、	单行文本，设置文字、字体、颜色、对齐，截取方式
-(UILabel*)createLabelSingleLine2{
    UILabel *label = [UILabel new];
    label.size = CGSizeMake(self.view.width-30, 30);
    label.text = @"单行（背景色、字体、颜色、居中）";
    label.backgroundColor = kLightGrayColor;
    label.font = kFont16B;
    label.textColor = kPrimaryNormalColor;
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

//1、	单行文本，设置文字、字体、颜色、对齐，截取方式
-(UILabel*)createLabelSingleLine3{
    UILabel *label = [UILabel new];
    label.size = CGSizeMake(200, 30);
    label.text = @"单行（超长截断）好长好长好长好长好长好长好长好长";
    label.font = kFont14;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    return label;
}

//1、	单行文本，设置文字、字体、颜色、对齐，截取方式
-(UILabel*)createLabelSingleLine4{
    UILabel *label = [UILabel new];
    label.size = CGSizeMake(100, 30);
    label.text = @"单行（自动调整字体）";
    label.font = kFont14;
    label.adjustsFontSizeToFitWidth = YES;
    return label;
}

//2、	多行文本，计算文本大小，改变文本框大小
-(UILabel*)createLabelMultiLine1{
    UILabel *label = [UILabel new];
    label.size = CGSizeMake(200, 50);
    label.text = @"2行（超长截断）好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长";
    label.font = kFont14;
    label.numberOfLines = 2;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    return label;
}

//2、	多行文本，计算文本大小，改变文本框大小
-(UILabel*)createLabelMultiLine2{
    UILabel *label = [UILabel new];
    label.size = CGSizeMake(self.view.width-30, 99999);
    label.text = @"多行（自适应）好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长";
    label.font = kFont14;
    label.numberOfLines = 0;
    [label sizeToFit];
    [label setCornerRadiusWith:@(2), @(LINE_HEIGHT), kBlackColor, nil];
    return label;
}

//2、	多行文本，计算文本大小，改变文本框大小
-(UILabel*)createLabelMultiLine3{
    UILabel *label = [UILabel new];
    label.text = @"多行（计算大小）好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长好长";
    label.font = kFont14;
    label.numberOfLines = 0;
    [label setCornerRadiusWith:@(2), @(LINE_HEIGHT), kBlackColor, nil];
    label.size = [label.text sizeWithFont:kFont14 fitWidth:150];
    return label;
}

@end
