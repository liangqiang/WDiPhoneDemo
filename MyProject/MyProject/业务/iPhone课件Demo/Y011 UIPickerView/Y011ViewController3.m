//
//  Y011ViewController3.m
//  MyProject
//
//  Created by caoyang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y011ViewController3.h"
#import "Y011ViewModel3.h"

@interface Y011ViewController3 ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)Y011ViewModel3 *viewModel;

@end

@implementation Y011ViewController3

-(UIPickerView*)createPickerViewCustom{
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
