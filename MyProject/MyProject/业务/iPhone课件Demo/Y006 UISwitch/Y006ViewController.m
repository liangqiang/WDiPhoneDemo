//
//  Y006ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/19.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y006ViewController.h"
#import "Y006ViewModel.h"

@interface Y006ViewController ()

@property(nonatomic,strong) Y006ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y006ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Y006 UISwicth";
    
    self.scrollView = [self createScrollView];
    [self.view addSubview:self.scrollView];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    
    [self.scrollView removeAllSections];
    for (NSString *viewType in self.viewModel.viewTypeArray) {
        UIView *hintSection = [self createHintSectionWithViewType:viewType];
        [self.scrollView addSection:hintSection];
        
        UIView *section = [UIView newWith:[UIColor clearColor], nil];
        NSString *selector = [NSString stringWithFormat:@"create%@", viewType];
        UIView *subview = [AJUtil performReturnSelector:NSSelectorFromString(selector) onTarget:self];
        
        [section addSubview:subview];
        section.size = CGSizeMake(self.scrollView.width, subview.height + 20);
        [subview layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, EAuto, EAuto)]; // 定位
        
        [self.scrollView addSection:section];
    }
}

-(UIView*)createHintSectionWithViewType:(NSString*)viewType{
    NSDictionary *dict = @{@"SwitchNormal": @"开关按钮(默认状态、点击响应)",
                           @"SwitchNormal1": @"开关按钮(开关状态)",
                           @"SwitchColor": @"开关按钮(开关颜色)",
                           };
    NSString *hint = [dict safeObjectFortKey:viewType];
    
    UILabel *label = [UILabel newWith: kFont12, kLightBlackColor, hint, nil];
    [label sizeToFit];
    
    UIView *section = [UIView newWith:[UIColor clearColor], nil];
    [section addSubview:label];
    section.size = CGSizeMake(self.scrollView.width, label.height + 10);
    [label layoutWithInsets:UIEdgeInsetsMake(EAuto, 15, EAuto, EAuto)]; // 定位
    
    return section;
}

//1、开关按钮、开关响应事件
-(UISwitch*)createSwitchNormal{
    UISwitch *theSwitch = [UISwitch new];
    theSwitch.size = CGSizeMake(self.scrollView.width - 200, 44);

    //UISwitch添加事件
    [theSwitch addTarget:self action:@selector(onNormalSwitchClick:) forControlEvents:UIControlEventValueChanged];
    
    return theSwitch;
}

-(void)onNormalSwitchClick:(id)sender{
    [self.viewModel onSwitchClicked:sender];
}

//2、开关状态
-(UISwitch*)createSwitchNormal1{
    UISwitch *theSwitch = [UISwitch new];
    theSwitch.size = CGSizeMake(self.scrollView.width - 200, 44);
    
    //UISwitch添加事件
    [theSwitch addTarget:self action:@selector(onNormalSwitchClick:) forControlEvents:UIControlEventValueChanged];
    
    [theSwitch setOn:YES];
    
    return theSwitch;
}

//3、开关颜色
-(UISwitch*)createSwitchColor{
    UISwitch *theSwitch = [UISwitch new];
    theSwitch.size = CGSizeMake(self.scrollView.width - 200, 44);
    
    //UISwitch添加事件
    [theSwitch addTarget:self action:@selector(onNormalSwitchClick:) forControlEvents:UIControlEventValueChanged];
    
    theSwitch.tintColor = kGrayColor;
    theSwitch.onTintColor = kRedColor;
    theSwitch.thumbTintColor = kBlackColor;
    
    return theSwitch;
}

@end
