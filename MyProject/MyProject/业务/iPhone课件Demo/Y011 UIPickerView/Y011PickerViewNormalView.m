//
//  Y011PickerViewNormalView.m
//  MyProject
//
//  Created by caoyang on 16/4/28.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011PickerViewNormalView.h"

@implementation Y011PickerViewNormalView


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


@end
