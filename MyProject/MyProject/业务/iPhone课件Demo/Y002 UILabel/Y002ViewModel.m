//
//  Y002ViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y002ViewModel.h"

@implementation Y002ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE( @"LabelSingleLine", @"单行文本"),
                       VIEWTYPE( @"LabelSingleLine2", @"单行文本，设置背景色，字体，颜色，居中"),
                       VIEWTYPE( @"LabelSingleLine3", @"单行文本，超长截断"),
                       VIEWTYPE( @"LabelSingleLine4", @"单行文本，自动调整字体"),
                       VIEWTYPE( @"LabelMultiLine1", @"单行文本，2行截断"),
                       VIEWTYPE( @"LabelMultiLine2", @"单行文本，自适应"),
                       VIEWTYPE( @"LabelMultiLine3", @"单行文本，计算大小"),
                       ];
    
    [self notifyToRefresh];
}

@end
