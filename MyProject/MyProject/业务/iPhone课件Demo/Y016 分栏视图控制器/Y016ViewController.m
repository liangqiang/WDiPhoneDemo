//
//  Y016ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y016ViewController.h"
#import "Y016ViewModel.h"
#import "Y016_1ViewController.h"
#import "Y016_2ViewController.h"
#import "Y016_3ViewController.h"
#import "Y016_4ViewController.h"


@interface Y016ViewController ()

@property (nonatomic,strong) Y016ViewModel *viewModel;

@end

@implementation Y016ViewController

-(void)loadView{
    [super loadView];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf updateView];
    }];
}
-(void)updateView{
    
    Y016_1ViewController *Y016_1VC = [Y016_1ViewController new];
    Y016_2ViewController *Y016_2VC = [Y016_2ViewController new];
    Y016_3ViewController *Y016_3VC = [Y016_3ViewController new];
    Y016_4ViewController *Y016_4VC = [Y016_4ViewController new];
    
    Y016_1VC.tabBarItem = [self createTabBarWithNormalImage:[self.viewModel imageSelected:0] SelectedImage:[self.viewModel imageSelected:1]];
    Y016_2VC.tabBarItem = [self createTabBarWithNormalImage:[self.viewModel imageSelected:2] SelectedImage:[self.viewModel imageSelected:3]];
    Y016_3VC.tabBarItem = [self createTabBarWithNormalImage:[self.viewModel imageSelected:4] SelectedImage:[self.viewModel imageSelected:5]];
    Y016_4VC.tabBarItem = [self createTabBarWithNormalImage:[self.viewModel imageSelected:6] SelectedImage:[self.viewModel imageSelected:7]];
    
    NSArray *array = @[Y016_1VC,Y016_2VC,Y016_3VC,Y016_4VC];
    self.viewControllers = array;
    self.selectedIndex = 0;
    
    
    //隐藏tabBar
    //self.tabBar.hidden = YES;
}



#pragma mark
-(UITabBarItem*)createTabBarWithNormalImage:(UIImage*)image1 SelectedImage:(UIImage*)image2{
    UIImage* NormalImage = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage* SelectedImage = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:nil image:NormalImage selectedImage:SelectedImage];
    return item;
}


@end
