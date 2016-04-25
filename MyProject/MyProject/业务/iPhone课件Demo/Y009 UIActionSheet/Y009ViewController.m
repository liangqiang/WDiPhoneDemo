//
//  Y009ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/24.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y009ViewController.h"
#import "Y009ViewModel.h"

@interface Y009ViewController ()<UIActionSheetDelegate>

@property(nonatomic,strong) Y009ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y009ViewController

-(UIButton*)createActionButton{
    UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, @"弹出多选框", nil];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    button.backgroundColor = kWhiteColor;
    [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
    return button;
}

//1、基本的多选择控制器
-(UIButton*)createActionSheetNormal{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onSheetNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onSheetNormalClicked:(id)sender{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择您的爱好" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //创建事件按钮
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:@"取消"];
    }];
    UIAlertAction *One = [UIAlertAction actionWithTitle:@"篮球" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:@"篮球"];
    }];
    
    UIAlertAction *Two = [UIAlertAction actionWithTitle:@"足球" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:@"足球"];
    }];
    
    UIAlertAction *Three = [UIAlertAction actionWithTitle:@"羽毛球" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.viewModel onActionSheetClicked:@"羽毛球"];
    }];
    
    
    //提示框中添加事件按钮
    [alertController addAction:cancle];
    [alertController addAction:One];
    [alertController addAction:Two];
    [alertController addAction:Three];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


//2、多选择控制器(ActionSheet)
-(UIButton*)createActionSheetNormal1{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onSheetNormal1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onSheetNormal1Clicked:(id)sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"选择Player" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"Kobe",@"James",@"Mac", nil];
    
    [actionSheet showInView:self.view];
}
#pragma makr ActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {

        case 0:
            [self.viewModel onActionSheetClicked:@"Kobe"];
            break;
        case 1:
            [self.viewModel onActionSheetClicked:@"James"];
            break;
        case 2:
            [self.viewModel onActionSheetClicked:@"Mac"];
            break;
        case 3:
            [self.viewModel onActionSheetClicked:@"取消"];
            break;
        default:
            break;
    }
}


//3、框架(多选择器)
-(UIButton*)createAJActionSheet{
    UIButton *button = [self createActionButton];
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onAJSheetClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
-(void)onAJSheetClicked:(id)sender{
    NSArray *buttons = @[@"Kobe", @"Cury",@"Tom",@"取消"];
    [AJUtil actionSheet:@"选择你的运动员" buttons:buttons block:^(NSInteger buttonIndex){
        NSString *info = [NSString stringWithFormat:@"您选择了：%@", [buttons safeObjectAtIndex:buttonIndex]];
        [AJUtil toast:info];
    }];
}


@end
