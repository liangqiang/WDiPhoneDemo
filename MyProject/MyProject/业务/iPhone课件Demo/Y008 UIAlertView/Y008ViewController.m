//
//  Y008ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y008ViewController.h"
#import "Y008ViewModel.h"

@interface Y008ViewController ()

@property(nonatomic,strong) Y008ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong) UIAlertAction *otherAction;
@property(nonatomic,strong) UITextField *userNameField;
@property(nonatomic,strong) UITextField *passWordField;

@end

@implementation Y008ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Y008 UIAlertView";
    
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


//基本提示框、响应事件
-(UIButton*)createAlertNormal{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"基本提示框、响应事件" forState:UIControlStateNormal];
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
    [button addTarget:self action:@selector(onAlertNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onAlertNormalClicked:(id)sender{
    NSString *title = NSLocalizedString(@"提示", nil);
    NSString *message = NSLocalizedString(@"网络断开成功", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"OK", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //创建事件按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        self.viewModel.clickMessage = @"你点击了取消";
        [self.viewModel submit];
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.clickMessage = @"你点击了确认";
        [self.viewModel submit];
    }];
    
    //提示框中添加事件按钮
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


//按钮列表模式
-(UIButton*)createAlertList{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"按钮列表模式" forState:UIControlStateNormal];
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
    [button addTarget:self action:@selector(onAlertListClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onAlertListClicked:(id)sender{
    NSString *title = NSLocalizedString(@"友情提示", nil);
    NSString *message = NSLocalizedString(@"请选择网络链接模式", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *otherButtonTitle1 = NSLocalizedString(@"Wifi", nil);
    NSString *otherButtonTitle2 = NSLocalizedString(@"4G", nil);
    NSString *otherButtonTitle3 = NSLocalizedString(@"本地连接", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //创建事件按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        self.viewModel.clickMessage = @"取消链接";
        [self.viewModel submit];
    }];
    
    UIAlertAction *otherAction1 = [UIAlertAction actionWithTitle:otherButtonTitle1 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.clickMessage = @"wifi链接";
        [self.viewModel submit];
    }];
    
    UIAlertAction *otherAction2 = [UIAlertAction actionWithTitle:otherButtonTitle2 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.clickMessage = @"4G链接";
        [self.viewModel submit];
    }];
    
    UIAlertAction *otherAction3 = [UIAlertAction actionWithTitle:otherButtonTitle3 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.clickMessage = @"本地连接";
        [self.viewModel submit];
    }];
    
    
    //提示框中添加事件按钮
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction1];
    [alertController addAction:otherAction2];
    [alertController addAction:otherAction3];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


//提示框(用户交互、信息输入)
-(UIButton*)createAlertTextField{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"提示框(用户交互、信息输入)" forState:UIControlStateNormal];
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
    [button addTarget:self action:@selector(onAlertTextFieldClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onAlertTextFieldClicked:(id)sender{
    NSString *title = NSLocalizedString(@"提示", nil);
    NSString *message = NSLocalizedString(@"请重新输入登录帐号密码", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"取消", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"登录", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //创建TextFiled
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        textField.placeholder = @"请输入用户名";
        self.userNameField = textField;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
        
        //密码模式
        textField.secureTextEntry = YES;
        textField.placeholder = @"请输入密码";
        self.passWordField = textField;
    }];
    
    //取消确认按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        self.viewModel.clickMessage = @"取消";
        [self.viewModel submit];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    self.otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.userName = self.userNameField.text;
        self.viewModel.passWord = self.passWordField.text;
        self.viewModel.clickMessage = self.userNameField.text;
        [self.viewModel submit];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    self.otherAction.enabled = NO;//设置确认按钮不可点击
    
    [alertController addAction:cancelAction];
    [alertController addAction:self.otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
    UITextField *textField = notification.object;
    
    if([self.viewModel checkLength:textField.text]){
        self.otherAction.enabled = YES;
    }
}

@end
