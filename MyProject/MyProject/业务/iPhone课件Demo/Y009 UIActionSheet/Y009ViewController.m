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

//1、基本的多选择控制器
-(UIButton*)createActionSheetNormal{
    return [self createButtonWithTitle:@"弹出上拉菜单" action:@selector(onSheetNormalClicked:)];
}

-(void)onSheetNormalClicked:(id)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择您的爱好" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //提示框中添加事件按钮
    [alertController addAction:[self createCancelActionWithTitle:@"取消"]];
    [alertController addAction:[self createDefaultActionWithTitle:@"篮球"]];
    [alertController addAction:[self createDefaultActionWithTitle:@"足球"]];
    [alertController addAction:[self createDefaultActionWithTitle:@"羽毛球"]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//2、多选择控制器(ActionSheet)
-(UIButton*)createActionSheetNormal1{
    return [self createButtonWithTitle:@"弹出上拉菜单" action:@selector(onSheetNormal1Clicked:)];
}
-(void)onSheetNormal1Clicked:(id)sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"选择Player"
                                                            delegate:self
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"Kobe",@"James",@"Mac", nil];
    
    [actionSheet showInView:self.view];
}

#pragma makr ActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    [self.viewModel onActionSheetClicked:buttonTitle];
}


//3、框架(多选择器)
-(UIButton*)createAJActionSheet{
    return [self createButtonWithTitle:@"弹出上拉菜单" action:@selector(onAJSheetClicked:)];
}

-(void)onAJSheetClicked:(id)sender{
    NSArray *buttons = @[@"Kobe", @"Cury",@"Tom",@"取消"];
    [AJUtil actionSheet:@"选择你的运动员" buttons:buttons block:^(NSInteger buttonIndex){
        NSString *info = [NSString stringWithFormat:@"您选择了：%@", [buttons safeObjectAtIndex:buttonIndex]];
        [AJUtil toast:info];
    }];
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
        [self.viewModel onActionSheetClicked:title];
    }];
    return alertAction;
}


@end
