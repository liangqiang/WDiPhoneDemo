//
//  Y001CustomPickerView.m
//  MyProject
//
//  Created by liangqiang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y001CustomPickerView.h"

@implementation Y001CustomPickerView

#pragma mark UIPickerViewDelegate
//定义cell的width 、 height
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return (component==0) ? self.width/3 : self.width*2/3;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (component == 0) {
        return [self provinceViewForRow:row reusingView:view];
    }else{
        return [self cityViewForRow:row reusingView:view];
    }
}

-(UIView*)provinceViewForRow:(NSInteger)row reusingView:(UIView*)view{
    if (!view) {
        view = [UIView newWith:kSuccessColor, nil];
        view.size = CGSizeMake(self.width/3, 40);
        
        UILabel *label = [UILabel newWith:kFont16B, kWhiteColor, @"", @(NSTextAlignmentCenter), nil];
        label.tag = tag(kPickerViewLabel);
        [view addSubview:label];
        [label layoutWithInsets:UIEdgeInsetsZero];
        
        UIImageView *imageView = [UIImageView newWith:@(UIViewContentModeScaleAspectFit), AJIconFontProvince, nil];
        imageView.size = CGSizeMake(20, 20);
        [view addSubview:imageView];
        [imageView layoutWithInsets:UIEdgeInsetsMake(EAuto, 8, EAuto, EAuto)];
    }
    
    UILabel *label = [view viewWithTag:tag(kPickerViewLabel)];
    label.text = [[self.componentArray safeObjectAtIndex:0] safeObjectAtIndex:row];
    
    return view;
}

-(UIView*)cityViewForRow:(NSInteger)row reusingView:(UIView*)view{
    if (!view) {
        view = [UIView newWith:kPrimaryColor, nil];
        view.size = CGSizeMake(self.width*2/3, 40);
        
        UILabel *label = [UILabel newWith:kFont16, kWhiteColor, @"", @(NSTextAlignmentCenter), nil];
        label.tag = tag(kPickerViewLabel);
        [view addSubview:label];
        [label layoutWithInsets:UIEdgeInsetsZero];
    }
    
    UILabel *label = [view viewWithTag:tag(kPickerViewLabel)];
    label.text = [[self.componentArray safeObjectAtIndex:1] safeObjectAtIndex:row];
    
    return view;
}

@end
