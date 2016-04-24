//
//  Y009ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y009ViewController.h"
#import "Y009ViewModel.h"

@interface Y009ViewController ()

@property(nonatomic,strong) Y009ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y009ViewController

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
    NSString *cancleButtom = NSLocalizedString(@"取消", nil);
    NSString *otherButton1 = NSLocalizedString(@"篮球", nil);
    NSString *otherButton2 = NSLocalizedString(@"足球", nil);
    NSString *otherButton3 = NSLocalizedString(@"羽毛球", nil);
    NSString *otherButton4 = NSLocalizedString(@"乒乓球", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    //创建事件按钮
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:cancleButtom style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:cancleButtom];
    }];
    UIAlertAction *One = [UIAlertAction actionWithTitle:otherButton1 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:otherButton1];
    }];
    
    UIAlertAction *Two = [UIAlertAction actionWithTitle:otherButton2 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:otherButton2];
    }];
    
    UIAlertAction *Three = [UIAlertAction actionWithTitle:otherButton3 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:otherButton3];
    }];
    
    UIAlertAction *Four = [UIAlertAction actionWithTitle:otherButton4 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:otherButton4];
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
