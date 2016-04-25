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

    return button;
}
-(void)onAlertNormalClicked:(id)sender{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络断开成功" preferredStyle:UIAlertControllerStyleAlert];
    
    //创建事件按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:@"取消"];
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:@"确认"];
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
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"请选择网络链接模式" preferredStyle:UIAlertControllerStyleAlert];
    
    //创建事件按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:@"取消"];
    }];
    
    UIAlertAction *otherAction1 = [UIAlertAction actionWithTitle:@"Wifi" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:@"Wifi"];
    }];
    
    UIAlertAction *otherAction2 = [UIAlertAction actionWithTitle:@"4G" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:@"4G"];
    }];
    
    UIAlertAction *otherAction3 = [UIAlertAction actionWithTitle:@"以太网" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onAlertViewClicked:@"以太网"];
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
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请重新输入登录帐号密码" preferredStyle:UIAlertControllerStyleAlert];
    
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
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        [self.viewModel onAlertViewClicked:@"取消"];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    self.otherAction = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.viewModel.userName = self.userNameField.text;
        self.viewModel.passWord = self.passWordField.text;
        
        [self.viewModel onAlertViewClicked:@"登录"];
        
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


//4、基本提示框(AlertView)、响应事件
-(UIButton*)createAlertViewNormal{
    UIButton *button = [self createAlertButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onAlertViewNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onAlertViewNormalClicked:(id)sender{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确认添加?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertView show];
}

#pragma mark ---AlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [self.viewModel onAlertViewClicked:@"取消"];
            break;
        case 1:
            [self.viewModel onAlertViewClicked:@"确认"];
            break;
        default:
            break;
    }
}


//5、框架(提示框)
-(UIButton*)createAJAlertNormal{
    UIButton *button = [self createAlertButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onAJAlertNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onAJAlertNormalClicked:(id)sender{
    NSArray *buttons = @[@"确定", @"取消"];
    [AJUtil alert:@"亲，你搞错了吧？" buttons:@[@"确定", @"取消"] block:^(NSInteger buttonIndex) {
        NSString *info = [NSString stringWithFormat:@"您选择了：%@", [buttons safeObjectAtIndex:buttonIndex]];
        [AJUtil toast:info];
    }];
}

@end
