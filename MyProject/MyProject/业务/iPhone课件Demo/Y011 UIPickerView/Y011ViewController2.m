//
//  Y011ViewController2.m
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewController2.h"
#import "Y011ViewModel2.h"

@interface Y011ViewController2 ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)Y011ViewModel2 *viewModel;

@property(nonatomic,strong)UIPickerView *pickerView;

@end

@implementation Y011ViewController2

-(UIPickerView*)createPickerViewNormal{
    self.pickerView = [UIPickerView new];
    self.pickerView.size = CGSizeMake(self.scrollView.width-120, 200);
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    return self.pickerView;
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {//省份个数
        return [self.viewModel.province count];
    } else {//市的个数
        return [self.viewModel.city count];
    }
}


#pragma mark UIPickerViewDelegate
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {//选择省份名
        return [self.viewModel.province objectAtIndex:row];
    } else {//选择市名
        return [self.viewModel.city objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        //获取第一个轮子当前选择的省
        NSString *seletedProvince = [self.viewModel.province objectAtIndex:row];
        
        //根据第一个轮子当前的省获取市
        self.viewModel.city = [self.viewModel.provinceCityDic objectForKey:seletedProvince];
        
        //重点！更新第二个轮子的数据
        [self.pickerView reloadComponent:1];
        
        //更新第二个轮子到第一个数据源
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        
        //获取第二个轮子当前的选择市
        NSString *seletedCity = [self.viewModel.city objectAtIndex:0];
        
        NSString *msg = [NSString stringWithFormat:@"province=%@,city=%@", seletedProvince,seletedCity];
        [self.viewModel onPickerViewSelected:msg];
    }
    else {
        //获取第一个轮子的省
        NSInteger selectedProvinceIndex = [self.pickerView selectedRowInComponent:0];
        NSString *seletedProvince = [self.viewModel.province objectAtIndex:selectedProvinceIndex];
        
        //获取第二个轮子的市
        NSString *seletedCity = [self.viewModel.city objectAtIndex:row];
        NSString *msg = [NSString stringWithFormat:@"province=%@,city=%@", seletedProvince,seletedCity];
        [self.viewModel onPickerViewSelected:msg];
    }
}


@end
