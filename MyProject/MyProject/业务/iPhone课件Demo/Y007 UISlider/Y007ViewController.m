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

//1、滑动条、滑动触发函数、读取滑动条值
-(UISlider*)createSliderNormal{
    UISlider *slider = [UISlider new];
    slider.size = CGSizeMake(self.view.width-100, 30);
    slider.continuous = NO; //避免连续触发事件
    
    [slider addTarget:self action:@selector(onNormalSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    return slider;
}

-(void)onNormalSliderValueChanged:(UISlider*)sender{
    [self.viewModel onSliderChanged:sender];
}

//2、初始值、最大值、最小值、
-(UISlider*)createSliderMaxMinValue{
    UISlider *slider = [UISlider new];
    slider.size = CGSizeMake(self.view.size.width-100, 30);
    slider.continuous = NO;
    
    [slider addTarget:self action:@selector(onNormalSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    [slider setValue:75.0 animated:YES];
    
    return slider;
}

//3、最大值颜色、最小值颜色
-(UISlider*)createSliderMaxColorMinColor{
    UISlider *slider = [UISlider new];
    slider.size = CGSizeMake(self.view.size.width-100, 30);
    slider.continuous = NO;
    
    [slider addTarget:self action:@selector(onNormalSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    
    slider.minimumTrackTintColor = kWhiteColor;
    slider.maximumTrackTintColor = kBlackColor;
    slider.thumbTintColor = kSuccessColor;
    
    return slider;
}

//4、滑动轮图片(默认、高亮)
-(UISlider*)createSliderHightLighted{
    UISlider *slider = [UISlider new];
    slider.size = CGSizeMake(self.view.size.width-100, 30);
    slider.continuous = NO;
    
    [slider addTarget:self action:@selector(onNormalSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    
    slider.minimumTrackTintColor = kSuccessColor;
    slider.maximumTrackTintColor = kDangerColor;
    
    [slider setThumbImage:AJIconFontWater forState:UIControlStateNormal];
    [slider setThumbImage:AJIconFontWaterHL forState:UIControlStateHighlighted];
    slider.minimumValueImage = AJIconFontVolumnLow;
    slider.maximumValueImage = AJIconFontVolumnHigh;
    
    return slider;
}

@end
