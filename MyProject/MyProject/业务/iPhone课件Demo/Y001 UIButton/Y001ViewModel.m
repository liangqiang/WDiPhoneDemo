//
//  Y001ViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y001ViewModel.h"

@implementation Y001ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE( @"ButtonSimple", @"简单按钮" ),
                       VIEWTYPE( @"ButtonHighlighted", @"按下有高亮效果" ),
                       VIEWTYPE( @"ButtonDisabled", @"置灰按钮" ),
                       VIEWTYPE( @"ButtonSelected", @"带选中状态的按钮" ),
                       VIEWTYPE( @"ButtonImage", @"带图片的按钮" ),
                       ];
    
    [self notifyToRefresh];
}

-(void)onButtonClicked:(UIButton*)button{
    [AJUtil toast:button.titleLabel.text];
}

@end
