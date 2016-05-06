//
//  Y013ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/3.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y013ViewModel : YScrollViewModel

//图片集合
@property (nonatomic,strong) NSMutableArray *imageArray;

////NSTimer使用时标记展示到第几张图片
@property NSInteger indexImage;

////2秒钟改变控件显示的图片标记
-(void)changeIndexImage;

@end
