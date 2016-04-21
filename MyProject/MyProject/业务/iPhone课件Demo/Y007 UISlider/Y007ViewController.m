//
//  Y007ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y007ViewController.h"
#import "Y007ViewModel.h"

@interface Y007ViewController ()

@property(nonatomic,strong) Y007ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation Y007ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Y007 UISlider";
    
    WEAKSELF
    self.scrollView = [self createScrollView];
    [self.view addSubview:self.scrollView];
    
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
    NSDictionary *dict = @{@"SliderNormal": @"基本滑块(滑动获取值)",
                           @"SliderMaxMinValue": @"滑块(最大值、最小值、默认值)",
                           @"SliderMaxColorMinColor":@"滑块(最大值颜色、最小值颜色)",
                           @"SliderHightLighted":@"滑块(滑轮的图片(默认、高亮))"
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

//1、滑动条、滑动触发函数、读取滑动条值
-(UISlider*)createSliderNormal{
    UISlider *slider = [UISlider new];
    slider.size = CGSizeMake(self.view.size.width-200, 30);
    
    [slider addTarget:self action:@selector(onNormalSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    return slider;
}

-(void)onNormalSliderValueChanged:(UISlider*)sender{
    self.viewModel.sliderValue = sender.value;
    
    [self.viewModel onSliderValueChanged];
}

//2、初始值、最大值、最小值、
-(UISlider*)createSliderMaxMinValue{
    UISlider *slider = [UISlider new];
    slider.size = CGSizeMake(self.view.size.width-200, 30);
    
    [slider addTarget:self action:@selector(onNormalSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    
    return slider;
}

//3、最大值颜色、最小值颜色
-(UISlider*)createSliderMaxColorMinColor{
    UISlider *slider = [UISlider new];
    slider.size = CGSizeMake(self.view.size.width-200, 30);
    
    [slider addTarget:self action:@selector(onNormalSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    
    slider.minimumTrackTintColor = kWhiteColor;
    slider.maximumTrackTintColor = kBlackColor;
    
    return slider;
}

//4、滑动轮图片(默认、高亮)
-(UISlider*)createSliderHightLighted{
    UISlider *slider = [UISlider new];
    slider.size = CGSizeMake(self.view.size.width-200, 30);
    
    [slider addTarget:self action:@selector(onNormalSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    
    slider.minimumTrackTintColor = kWhiteColor;
    slider.maximumTrackTintColor = kBlackColor;
    
    [slider setThumbImage:AJIconFontSmile forState:UIControlStateNormal];
    [slider setThumbImage:AJIconFontSmileHL forState:UIControlStateHighlighted];
    
    return slider;
}

@end
