//
//  Y014ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/4.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y014ViewModel.h"

@implementation Y014ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"", @"init:ViewController创建的时候调用"),
                           VIEWTYPE(@"", @"loadView:控制器的View为空的时候被调用"),
                           VIEWTYPE(@"", @"viewDidLoad: View创建成功，最适合创建一些附加的view和控件"),
                           VIEWTYPE(@"", @"viewWillAppear:视图即将出现,调用方法"),
                           VIEWTYPE(@"", @"viewDidAppear:视图出现,调用方法"),
                           VIEWTYPE(@"", @"viewWillDisappear:视图即将消失、被覆盖或是隐藏时调用"),
                           VIEWTYPE(@"", @"viewDidDisappear:视图消失、被覆盖或是隐藏时调用"),
                           VIEWTYPE(@"", @"viewWillUnload:当内存过低时，需要释放一些不需要使用的视图时，即将释放时调用"),
                           VIEWTYPE(@"", @"viewDidUnload:当内存过低时，需要释放一些不需要使用的视图时，释放调用"),
                           VIEWTYPE(@"", @"dealloc:视图控制器为nil时调用"),
                           ];
    
    [self notifyToRefresh];
}

-(void)onButtonClicked:(NSString*)vc{
    [AJNavi pushViewController:vc];
}

@end
