//
//  Y009ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y009ViewController.h"
#import "Y009ViewModel.h"

@interface Y009ViewController ()

@property(nonatomic,strong) Y009ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y009ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Y009 UIActionSheet";
    
    self.scrollView = [self createScrollView];
    [self.view addSubview:self.scrollView];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [weakSelf.viewModel setRefreshBlock:^{
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


//1、基本的多选择控制器
-(UIButton*)createActionSheetNormal{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"基本的多选择控制器" forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryColor forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    button.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onSheetNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onSheetNormalClicked:(id)sender{
    NSString *title = NSLocalizedString(@"提示", nil);
    NSString *message = NSLocalizedString(@"请选择您的爱好", nil);
    NSString *can = NSLocalizedString(@"取消", nil);
    NSString *A = NSLocalizedString(@"篮球", nil);
    NSString *B = NSLocalizedString(@"足球", nil);
    NSString *C = NSLocalizedString(@"羽毛球", nil);
    NSString *D = NSLocalizedString(@"乒乓球", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    //创建事件按钮
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:can style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        self.viewModel.enjoyMessage = @"不喜欢任何运动";
        [self.viewModel submit];
    }];
    UIAlertAction *One = [UIAlertAction actionWithTitle:A style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.enjoyMessage = @"喜欢任何篮球";
        [self.viewModel submit];
    }];
    
    UIAlertAction *Two = [UIAlertAction actionWithTitle:B style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.enjoyMessage = @"喜欢足球";
        [self.viewModel submit];
    }];
    
    UIAlertAction *Three = [UIAlertAction actionWithTitle:C style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.enjoyMessage = @"喜欢羽毛球";
        [self.viewModel submit];
    }];
    
    UIAlertAction *Four = [UIAlertAction actionWithTitle:D style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.enjoyMessage = @"喜欢乒乓球";
        [self.viewModel submit];
    }];
    
    
    //提示框中添加事件按钮
    [alertController addAction:cancle];
    [alertController addAction:One];
    [alertController addAction:Two];
    [alertController addAction:Three];
    [alertController addAction:Four];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
