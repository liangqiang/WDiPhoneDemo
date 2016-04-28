//
//  Y011PickerViewCustomView.m
//  MyProject
//
//  Created by caoyang on 16/4/28.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011PickerViewCustomView.h"

@implementation Y011PickerViewCustomView

-(instancetype)init{
    self = [super init];
    if(self){
        
        self.backgroundColor = kGrayColor;
        self.alpha = kViewAlpha;
        
        self.dataPicker = [[UIPickerView alloc] init];
        [self.dataPicker setFrame:CGRectMake(0, 0, 200, 200)];
        self.dataPicker.delegate = self;
        self.dataPicker.dataSource = self;
        [self addSubview:self.dataPicker];
        
        UIButton *button = [UIButton newWith:kFont14, kPrimaryColor, @"取消", nil];
        button.frame = CGRectMake(0, 220, 200, 44);
        button.backgroundColor = kWhiteColor;
        [button setCornerRadiusWith:@(8), @(LINE_HEIGHT), kLightGrayColor, nil];
        [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

-(void)onButtonClicked:(id)sender{
    [self removeFromSuperview];
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.viewModel.cityArray count];
}


#pragma mark UIPickerViewDelegate
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.viewModel.cityArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.viewModel onPickerViewSelected:[self.viewModel.cityArray objectAtIndex:row]];
}

//定义cell的width 、 height
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 60;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 80;
}

//自定义显示的字体大小及样式
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = UITextAlignmentCenter;
        [pickerLabel setBackgroundColor:kRedColor];
        [pickerLabel setFont:kFont14];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

@end
