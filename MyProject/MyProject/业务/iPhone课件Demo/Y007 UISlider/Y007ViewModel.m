//
//  Y007ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/20.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y007ViewModel.h"

@implementation Y007ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE( @"SliderNormal", @"基本滑块(滑动获取值)"),
                           VIEWTYPE( @"SliderMaxMinValue", @"滑块(最大值、最小值、默认值)"),
                           VIEWTYPE( @"SliderMaxColorMinColor", @"滑块(最大值颜色、最小值颜色)"),
                           VIEWTYPE( @"SliderHightLighted", @"滑块(滑轮的图片(默认、高亮))"),
                           ];

    [self notifyToRefresh];
}

-(void)onSliderChanged:(UISlider*)slider{    
    if (slider.maximumValue >= 100) {
        [AJUtil toast:[NSString stringWithFormat:@"%zd", (NSInteger)slider.value]];
    }else{
        [AJUtil toast:[NSString stringWithFormat:@"%f", slider.value]];
    }
}

@end
