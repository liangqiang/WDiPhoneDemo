//
//  Y008ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y008ViewController.h"
#import "Y008ViewModel.h"

@interface Y008ViewController ()<UIAlertViewDelegate>

@property(nonatomic,strong) Y008ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong) UITextField *userNameField;
@property(nonatomic,strong) UITextField *passWordField;
@property(nonatomic,strong) UIAlertAction *loginAction;
@end

@implementation Y008ViewController


//1. 基本提示框(AlertView)、响应事件
-(UIButton*)createAlertViewNormal{
    return [self createButtonWithTitle:@"弹出提示框" action:@selector(onAlertViewNormalClicked:)];
}

-(void)onAlertViewNormalClicked:(id)sender{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确认添加?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertView show];
}

#pragma mark - AlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self.viewModel onAlertViewClicked:@"确认添加"];
    }
}

//2、框架(提示框)
-(UIButton*)createAJAlertNormal{
    return [self createButtonWithTitle:@"弹出提示框" action:@selector(onAJAlertNormalClicked:)];
}

-(void)onAJAlertNormalClicked:(id)sender{
    NSArray *buttons = @[@"嗯，是搞错了", @"你才错了呢"];
    WEAKSELF
    [AJUtil alertMessage:@"亲，你搞错了吧？" buttons:buttons block:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [weakSelf.viewModel onAlertViewClicked:@"确认搞错了"];
        }
    }];
}

//3、基本提示框、响应事件
-(UIButton*)createAlertNormal{
    return [self createButtonWithTitle:@"弹出提示框" action:@selector(onAlertNormalClicked:)];
}

-(void)onAlertNormalClicked:(id)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络断开成功" preferredStyle:UIAlertControllerStyleAlert];
    
    //提示框中添加事件按钮
    [alertController addAction:[self createCancelActionWithTitle:@"取消"]];
    [alertController addAction:[self createDefaultActionWithTitle:@"确认"]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//4、按钮列表模式
-(UIButton*)createAlertList{
    return [self createButtonWithTitle:@"弹出提示框" action:@selector(onAlertListClicked:)];
}

-(void)onAlertListClicked:(id)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"请选择网络链接模式" preferredStyle:UIAlertControllerStyleAlert];
    
    //提示框中添加事件按钮
    [alertController addAction:[self createCancelActionWithTitle:@"取消"]];
    [alertController addAction:[self createDefaultActionWithTitle:@"Wifi"]];
    [alertController addAction:[self createDefaultActionWithTitle:@"4G"]];
    [alertController addAction:[self createDefaultActionWithTitle:@"以太网"]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//5、提示框(用户交互、信息输入)
-(UIButton*)createAlertTextField{
    return [self createButtonWithTitle:@"弹出提示框" action:@selector(onAlertTextFieldClicked:)];
}

-(void)onAlertTextFieldClicked:(id)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请重新输入登录帐号密码" preferredStyle:UIAlertControllerStyleAlert];
    
    //创建用户名、密码 TextFiled
    WEAKSELF
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入用户名";
        weakSelf.userNameField = textField;
        [textField handleEvent:UIControlEventEditingChanged withBlock:^(UIControl *control) {
            [weakSelf checkTextFields];
        }];
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        //密码模式
        textField.secureTextEntry = YES;
        textField.placeholder = @"请输入密码";
        weakSelf.passWordField = textField;
        [textField handleEvent:UIControlEventEditingChanged withBlock:^(UIControl *control) {
            [weakSelf checkTextFields];
        }];
    }];
    
    //取消确认按钮
    self.loginAction = [self createDefaultActionWithTitle:@"登录"];
    [alertController addAction:[self createCancelActionWithTitle:@"取消"]];
    [alertController addAction:self.loginAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    [self checkTextFields];
}

-(void)checkTextFields{
    if (self.userNameField.text.length > 0 && self.passWordField.text.length > 0) {
        self.loginAction.enabled = YES;
    }else{
        self.loginAction.enabled = NO;
    }
}

#pragma mark -
-(UIButton*)createButtonWithTitle:(NSString*)title action:(SEL)action{
    UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, title, nil];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    button.backgroundColor = kWhiteColor;
    [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(UIAlertAction*)createDefaultActionWithTitle:(NSString*)title{
    return [self createActionWithTitle:title style:UIAlertActionStyleDefault];
}

-(UIAlertAction*)createCancelActionWithTitle:(NSString*)title{
    return [self createActionWithTitle:title style:UIAlertActionStyleCancel];
}

-(UIAlertAction*)createActionWithTitle:(NSString*)title style:(UIAlertActionStyle)style{
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:title];
    }];
    return alertAction;
}


@end
