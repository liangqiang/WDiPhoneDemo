//
//  Y011ViewController1.m
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewController.h"
#import "Y011ViewModel.h"
#import "AJPickerView.h"
#import "Y001CustomPickerView.h"

@interface Y011ViewController ()

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y011ViewModel *viewModel;

@end

@implementation Y011ViewController

-(UIPickerView*)createPickerViewNormal{
    AJPickerView *pickerView = [AJPickerView new];
    pickerView.size = CGSizeMake(self.scrollView.width, 120);
    pickerView.componentArray = self.viewModel.cityComponentArray;
    
    WEAKSELF
    [pickerView setSelectBlock:^(id pickerView, NSInteger component, NSInteger row) {
        [weakSelf.viewModel onCitySelected:component row:row];
    }];

    return pickerView;
}

-(UIPickerView*)createPickerViewNormal2{
    AJPickerView *pickerView = [AJPickerView new];
    pickerView.size = CGSizeMake(self.scrollView.width, 120);
    pickerView.componentArray = self.viewModel.provinceComponentArray;
    
    WEAKSELF
    [pickerView setSelectBlock:^(id pickerView, NSInteger component, NSInteger row) {
        [weakSelf.viewModel onProvinceSelectd:component row:row];
        if (component == 0) {
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
        }
    }];
    
    return pickerView;
}

-(UIPickerView*)createPickerViewCustom{
    Y001CustomPickerView *pickerView = [Y001CustomPickerView new];
    pickerView.size = CGSizeMake(self.scrollView.width, 120);
    pickerView.componentArray = self.viewModel.provinceComponentArray;
    
    WEAKSELF
    [pickerView setSelectBlock:^(id pickerView, NSInteger component, NSInteger row) {
        [weakSelf.viewModel onProvinceSelectd:component row:row];
        if (component == 0) {
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
        }
    }];
    
    return pickerView;
}


@end
