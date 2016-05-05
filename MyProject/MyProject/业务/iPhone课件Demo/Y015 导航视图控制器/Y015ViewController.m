//
//  Y015ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/4.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y015ViewController.h"
#import "Y015ViewModel.h"
#import "Y015ViewController2.h"

@interface Y015ViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y015ViewModel *viewModel;
@end

@implementation Y015ViewController

//1、创建按钮、响应事件、页面跳转(导航)
-(UIButton*)createPushViewNormal{
    return [self createButtonWithTitle:@"导航进入下页面" action:@selector(onPushViewNormalClicked:)];
}
-(void)onPushViewNormalClicked:(id)sender{
    Y015ViewController2 *Y015VC = [[Y015ViewController2 alloc] init];
    [self.navigationController pushViewController:Y015VC animated:YES];
}

//2、框架跳转(导航)
-(UIButton*)createPushViewAJFoundation{
    return [self createButtonWithTitle:@"导航进入下页面" action:@selector(onPushViewAJFoundationClicked:)];
}
-(void)onPushViewAJFoundationClicked:(id)sender{
    [self.viewModel onPushButtonClicked:@"Y015ViewController2"];
}

//3、标题左右按钮、响应事件、页面跳转(导航)
-(void)createPushViewLeftRight{
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Push" style:UIBarButtonItemStyleDone target:self action:@selector(onRightBarItemClicked:)];
    
    //UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onRightBarItemClicked:)];
    
    self.navigationItem.rightBarButtonItem = anotherButton;
}
-(void)onRightBarItemClicked:(id)sender{
    [self.viewModel onPushButtonClicked:@"Y015ViewController2"];
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

@end
