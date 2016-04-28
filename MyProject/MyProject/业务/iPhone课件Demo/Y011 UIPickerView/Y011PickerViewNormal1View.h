//
//  Y011PickerViewNormal1View.h
//  MyProject
//
//  Created by caoyang on 16/4/28.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y011ViewModel.h"

@interface Y011PickerViewNormal1View : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)Y011ViewModel *viewModel;
@property(nonatomic,strong)UIPickerView *dataPicker;

-(instancetype)init;

@end
