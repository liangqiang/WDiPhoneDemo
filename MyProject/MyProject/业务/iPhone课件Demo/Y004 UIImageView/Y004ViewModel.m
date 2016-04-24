//
//  Y004ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/4/18.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y004ViewModel.h"

@implementation Y004ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE( @"ImageViewSimple", @"显示图片，缩放（原比例）,点击修改contentMode"),
                           VIEWTYPE( @"LabelContentModel", @""),
                           VIEWTYPE( @"ImageViewFrames", @"播放多图片模拟动画"),
                           VIEWTYPE( @"ImageViewGif", @"播放gif动画（webView）"),
                           ];
    
    [self notifyToRefresh];
}

@end
