//
//  Y011ViewController1.m
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewController1.h"
#import "Y011ViewModel1.h"


@interface Y011ViewController1 ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y011ViewModel1 *viewModel;

@end

@implementation Y011ViewController1

-(UIPickerView*)createPickerViewNormal{
    UIPickerView *pickerView = [UIPickerView new];
    pickerView.size = CGSizeMake(self.scrollView.width-120, 200);
    pickerView.dataSource = self;
    pickerView.delegate = self;
    return pickerView;
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
