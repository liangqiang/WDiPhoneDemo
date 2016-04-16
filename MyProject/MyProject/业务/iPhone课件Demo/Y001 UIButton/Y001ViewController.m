//
//  Y001ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y001ViewController.h"
#import "Y001ViewModel.h"

@interface Y001ViewController ()
@property (nonatomic,strong) Y001ViewModel *viewModel;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation Y001ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Y001 UIButton";

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
        UIView *subview = [AJUtil performSelector:NSSelectorFromString(selector) onTarget:self];
        
        [section addSubview:subview];
        section.size = CGSizeMake(self.scrollView.width, subview.height + 20);
        [subview layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, EAuto, EAuto)]; // 定位
        
        [self.scrollView addSection:section];
    }
}

//1、	创建默认的文字button，响应点击事件
-(UIButton*)createButtonSimple{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"点我吧（无状态）" forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    button.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onNormalButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

//点击按钮触发的方法
-(void)onNormalButtonClicked:(id)sender{
    [self.viewModel onButtonClicked:sender];
}

//2、	不同状态（默认、选中、高亮、禁用）下，button的文字（字体颜色）、背景图
-(UIButton*)createButtonStates{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    button.titleLabel.font = kFont14;
    
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryLightColor forState:UIControlStateHighlighted];
    [button setTitleColor:kLightGrayColor forState:UIControlStateDisabled];
    
    //设置按钮的背景颜色
    [button setBackgroundImage:[UIImage newWithColor:kWhiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage newWithColor:kLightGrayColor] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage newWithColor:kGrayColor] forState:UIControlStateDisabled];
    
    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onNormalButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(UIButton*)createButtonHighlighted{
    UIButton *button = [self createButtonStates];
    [button setTitle:@"点我吧（有高亮状态）" forState:UIControlStateNormal];
    return button;
}

-(UIButton*)createButtonDisabled{
    UIButton *button = [self createButtonStates];
    [button setTitle:@"点我吧（不可点）" forState:UIControlStateNormal];
    button.enabled = NO;
    return button;
}

//3、	checkbox样式，图片切换
-(UIButton*)createButtonSelected{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    [button setTitle:@"点我吧（选中）" forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];

    [button setImage:AJIconFontUnselected forState:UIControlStateNormal];
    [button setImage:AJIconFontSelected forState:UIControlStateSelected];
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [button handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        UIButton *btn = (UIButton*)control;
        btn.selected = !btn.selected;
    }];
    
    return button;
}

//4、	带小图片的button，可以调整图片、文字位置
-(UIButton*)createButtonImage{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"点我吧（带图片）" forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryLightColor forState:UIControlStateHighlighted];
    
    //设置按钮的背景颜色
    [button setBackgroundImage:[UIImage newWithColor:kWhiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage newWithColor:kLightGrayColor] forState:UIControlStateHighlighted];
    
    [button setImage:AJIconFontSmile forState:UIControlStateNormal];
    [button setImage:AJIconFontSmileHL forState:UIControlStateHighlighted];
    
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 20);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);

    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onNormalButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
