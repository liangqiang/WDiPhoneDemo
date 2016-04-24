//
//  Y008ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
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

-(UIButton*)createAlertButton{
    UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, @"弹出提示框", nil];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    button.backgroundColor = kWhiteColor;
    [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
    return button;
}

//1、基本提示框、响应事件
-(UIButton*)createAlertNormal{
    UIButton *button = [self createAlertButton];

    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onAlertNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //[AJUtil alert:@"网络断了" buttons:@[@"确定"] block:^(NSInteger buttonIndex) {
        
    //}];
    
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
        [self.viewModel onAlertViewClicked:cancelButtonTitle];
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:otherButtonTitle];
    }];
    
    //提示框中添加事件按钮
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


//2、按钮列表模式
-(UIButton*)createAlertList{
    UIButton *button = [self createAlertButton];
    
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
        [self.viewModel onAlertViewClicked:cancelButtonTitle];
    }];
    
    UIAlertAction *otherAction1 = [UIAlertAction actionWithTitle:otherButtonTitle1 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:otherButtonTitle1];
    }];
    
    UIAlertAction *otherAction2 = [UIAlertAction actionWithTitle:otherButtonTitle2 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:otherButtonTitle2];
    }];
    
    UIAlertAction *otherAction3 = [UIAlertAction actionWithTitle:otherButtonTitle3 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:otherButtonTitle3];
    }];
    
    
    //提示框中添加事件按钮
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction1];
    [alertController addAction:otherAction2];
    [alertController addAction:otherAction3];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


//3、提示框(用户交互、信息输入)
-(UIButton*)createAlertTextField{
    UIButton *button = [self createAlertButton];
    
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
    
    //创建用户名、密码 TextFiled
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
        
        [self.viewModel onAlertViewClicked:cancelButtonTitle];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    self.otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.userName = self.userNameField.text;
        self.viewModel.passWord = self.passWordField.text;
        
        [self.viewModel onAlertViewClicked:otherButtonTitle];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    self.otherAction.enabled = NO;//设置确认按钮不可点击
    
    [alertController addAction:cancelAction];
    [alertController addAction:self.otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
    UITextField *passWordTextField = notification.object;
    
    if([self.viewModel checkLength:passWordTextField.text]){
        self.otherAction.enabled = YES;
    }
}



@end
