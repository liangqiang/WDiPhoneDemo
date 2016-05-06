//
//  Y014ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/4.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y014ViewController.h"
#import "Y014ViewModel.h"

@interface Y014ViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y014ViewModel *viewModel;
@end

@implementation Y014ViewController

/*
 不要出现创建view的代码。
 良好的设计，在init里应该只有相关数据的初始化，而且这些数据都是比较关键的数据。
 init里不要掉self.view，否则会导致viewcontroller创建view。
 此方法在ViewController创建的时候调用
 */
-(instancetype)init{
    if (self=[super init]) {
        self.title = @"生命周期";
    }
    return self;
}


/*
只初始化view，一般用于创建比较关键的view如tableViewController的 tabView，UINavigationController的navgationBar，不可掉用view的getter（在掉super  loadView前），最好也不要初始化一些非关键的view。
 如果你是从nib文件中创建的viewController在这里一定要首先调用 super的loadView方法，但建议不要重载这个方法。
 此方法在控制器的View为空的时候被调用
 */

-(void)loadView{
    [super loadView];
    //[self createTableView];
}


/*
 View创建成功，最适合创建一些附加的view和控件了。
 有一点需要注意的是，viewDidLoad会调用多次（viewcontroller可能多次载入view)
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [UILabel new];
    label.size = CGSizeMake(200, 30);
    label.font = kFont14;
    [self.scrollView addSection:label];
}


/*
 在这里可以进行一些显示前的处理。比如键盘弹出，一些特殊的过程动画（比如状态条和navigationbar颜色）。
 视图即将出现
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.backgroundColor = kGrayColor;
}


/*
 一般用于显示后，在切换动画后，如果有需要的操作，可以在这里加入相关代码。
 视图出现后
 */
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}


/*
 视图即将消失、被覆盖或是隐藏时调用
 tabBar隐藏
 */
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
}


/*
 视图已经消失、被覆盖或是隐藏时调用
 tabBar隐藏
 */
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
}


/*
 当内存过低时，需要释放一些不需要使用的视图时，即将释放时调用
 */
-(void)viewWillUnload{
    [super viewWillUnload];
}


/*
 当内存过低，释放一些不需要的视图时调用
 */
-(void)viewDidUnload{
    [super viewDidUnload];
    
    self.view = nil;
}


/*
 视图的retaincount = 0调用
 */
//-(void)dealloc{
//    [super dealloc];
//}

@end
