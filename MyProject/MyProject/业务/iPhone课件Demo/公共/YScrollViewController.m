//
//  YViewController.m
//  MyProject
//
//  Created by liangqiang on 16/4/22.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewController.h"
#import "YScrollViewModel.h"

@interface YScrollViewController ()

@property (nonatomic,strong) YScrollViewModel *viewModel;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,assign) NSInteger viewIndex;

@end

@implementation YScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
    // 清除scrollView下所有内容
    [self.scrollView removeAllSections];
    
    // 根据viewType创建界面
    self.viewIndex = 0;
    for (YViewTypeItem *item in self.viewModel.viewTypeArray) {
        [self.scrollView addSection:[self createHintSection:item]];
        [self.scrollView addSection:[self createViewSection:item]];
    }
}

-(UIView*)createHintSection:(YViewTypeItem*)item{
    if (item.hint.length == 0) return nil;
    
    self.viewIndex += 1;
//    NSInteger index = [self.viewModel.viewTypeArray indexOfObject:item];
    NSString *hint = [NSString stringWithFormat:@"%zd、%@", self.viewIndex, item.hint];
    UILabel *label = [UILabel newWith: kFont12, kLightBlackColor, hint, nil];
    [label sizeToFit];
    
    UIView *section = [UIView newWith:kLightGrayColor, nil];
    [section addSubview:label];
    section.size = CGSizeMake(self.scrollView.width, label.height + 10);
    [label layoutWithInsets:UIEdgeInsetsMake(EAuto, 15, EAuto, EAuto)]; // 定位
    
    return section;
}

-(UIView*)createViewSection:(YViewTypeItem*)item{
    UIView *section = [UIView newWith:[UIColor clearColor], nil];
    NSString *selector = [NSString stringWithFormat:@"create%@", item.viewType];
    UIView *subview = [AJUtil performReturnSelector:NSSelectorFromString(selector) onTarget:self];
    
    [section addSubview:subview];
    section.size = CGSizeMake(self.scrollView.width, subview.height + 20);
    [subview layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, EAuto, EAuto)]; // 定位
    return section;
}


@end
