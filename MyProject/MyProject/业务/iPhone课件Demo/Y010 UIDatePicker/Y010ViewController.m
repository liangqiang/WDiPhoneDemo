//
//  Y010ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y010ViewController.h"
#import "Y010ViewModel.h"

@interface Y010ViewController ()

@property(nonatomic,strong) Y010ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong) UIView *myView;
@property(nonatomic,strong) UIDatePicker *pDatePicker;

@end

@implementation Y010ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [self createScrollView];
    [self.view addSubview:self.scrollView];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [weakSelf.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}
-(void)updateViews{
    [self.scrollView removeAllSections];
    for (NSString *viewType in self.viewModel.viewTypeArray) {
        UIView *section = [UIView newWith:[UIColor clearColor], nil];
        NSString *selector = [NSString stringWithFormat:@"create%@", viewType];
        UIView *subview = [AJUtil performSelector:NSSelectorFromString(selector) onTarget:self];
        
        [section addSubview:subview];
        section.size = CGSizeMake(self.scrollView.width, subview.height + 20);
        [subview layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, EAuto, EAuto)]; // 定位
        
        [self.scrollView addSection:section];
    }
}

-(UIView*)createView{
    UIView *view = [UIView new];
    view.size = CGSizeMake(self.scrollView.width, 240);
    view.backgroundColor = kGrayColor;
    [self.scrollView addSection:view];
    
    
    UIButton *buttonCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonCancel.frame = CGRectMake(10, 200, 120, 40);
    
    //设置按钮的显示标签
    [buttonCancel setTitle:@"取消" forState:UIControlStateNormal];
    [buttonCancel setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    buttonCancel.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    buttonCancel.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    buttonCancel.layer.cornerRadius = 8;
    buttonCancel.layer.borderWidth = LINE_HEIGHT;
    buttonCancel.layer.borderColor = kLightGrayColor.CGColor;
    buttonCancel.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [buttonCancel addTarget:self action:@selector(onCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UIButton *buttonCinfirm = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonCinfirm.frame = CGRectMake(190, 200, 120, 40);
    
    //设置按钮的显示标签
    [buttonCinfirm setTitle:@"确认" forState:UIControlStateNormal];
    [buttonCinfirm setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    buttonCinfirm.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    buttonCinfirm.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    buttonCinfirm.layer.cornerRadius = 8;
    buttonCinfirm.layer.borderWidth = LINE_HEIGHT;
    buttonCinfirm.layer.borderColor = kLightGrayColor.CGColor;
    buttonCinfirm.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [buttonCinfirm addTarget:self action:@selector(onCinfirmClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [view addSubview:buttonCancel];
    [view addSubview:buttonCinfirm];
    
    self.myView = view;
    
    return view;
}
-(void)onCancelClicked:(id)sender{
    self.viewModel.dateMessage = @"取消选择时间";
    [self.viewModel submit];
    
    [self.myView removeFromSuperview];
    
    [self.scrollView removeLastSections:self.myView];
}
//规定时间显示格式
-(void)onCinfirmClicked:(id)sended{
    NSDate *select = [self.pDatePicker date]; //获取控件选择的时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];//设置时间显示样式
    NSString *dateAndTime =  [dateFormatter stringFromDate:select];
    
    self.viewModel.dateMessage = dateAndTime;
    [self.viewModel submit];
    
    [self.myView removeFromSuperview];
    
    [self.scrollView removeLastSections:self.myView];
}


//1、基本时间控件、选择时间
-(UIButton*)createDatePickerNormal{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"基本时间控件、选择时间" forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    button.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerNormalClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;

}
-(void)onDatePickerNormalClicked:(id)sender{
    UIView *view = [self createView];
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    [view addSubview:datePicker];
    
    self.pDatePicker = datePicker;
}


//2、时间控件中文格式
-(UIButton*)createDatePickerChina{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"时间控件中文格式" forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    button.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerChinaClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;

}
-(void)onDatePickerChinaClicked:(id)sender{
    
    UIView *view = [self createView];
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    
    //设置控件成中文模式
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    //[datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"] ];
    
    [view addSubview:datePicker];
    
    self.pDatePicker = datePicker;
}


//3、显示模式
-(UIButton*)createDatePickerStyle{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"显示模式" forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    button.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerStyleClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;

}
-(void)onDatePickerStyleClicked:(id)sender{
    
    UIView *view = [self createView];
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    
    //设置控件成中文模式
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    //[datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"] ];
    
    // 显示模式(1、年月日 2、年月日 时分秒 3、时分秒 4、秒表)
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    [view addSubview:datePicker];
    
    self.pDatePicker = datePicker;
}


//4、控件中最大最小时间
-(UIButton*)createDatePickerMinMaxValue{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"控件中最大最小时间" forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    button.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerMinMaxValueClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;

}
-(void)onDatePickerMinMaxValueClicked:(id)sender{
    UIView *view = [self createView];
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.size = CGSizeMake(self.scrollView.width, 200);
    
    //设置控件成中文模式
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    //[datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"] ];
    
    // 显示模式(1、年月日 2、年月日 时分秒 3、时分秒 4、秒表)
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    //设定控件的最大选择时间和最小选择时间
    NSDate *dateMin=[NSDate date];
    datePicker.minimumDate=dateMin;
    NSDate *dateMax=[NSDate dateWithTimeIntervalSinceNow:365*24*60*60];
    datePicker.maximumDate=dateMax;

    
    [view addSubview:datePicker];
    
    self.pDatePicker = datePicker;
}


//5、秒表
-(UIButton*)createDatePickerTimer{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.size = CGSizeMake(self.scrollView.width - 100, 44);
    
    //设置按钮的显示标签
    [button setTitle:@"秒表" forState:UIControlStateNormal];
    [button setTitleColor:kPrimaryNormalColor forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    
    //设置按钮的背景颜色
    button.backgroundColor = kWhiteColor ;
    
    //设置圆角，边线
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = LINE_HEIGHT;
    button.layer.borderColor = kLightGrayColor.CGColor;
    button.clipsToBounds = YES;
    
    //添加按钮的触摸事件(按钮按下)
    [button addTarget:self action:@selector(onDatePickerTimerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;

}
-(void)onDatePickerTimerClicked:(id)sender{
    
}


@end
