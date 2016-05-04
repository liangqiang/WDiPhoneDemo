//
//  Y013ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/3.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y013ViewModel.h"

@implementation Y013ViewModel

-(void)loadData{
    self.viewTypeArray = @[VIEWTYPE(@"ScrollViewBigImage", @"用滑动控件显示一个非常大的图片、显示大小、内容大小、增加滚动区域"),
                           VIEWTYPE(@"ScrollViewNormal", @"一个基本的滑动控件(展示多张图片、垂直、回弹、偏移)"),
                           VIEWTYPE(@"ScrollViewTimer", @"时间循环播放图片展示"),
                           VIEWTYPE(@"ScrollViewPageController", @"联合展示图片、标记滑动到第几个选项"),
                           VIEWTYPE(@"PageController", @"用来和上面的滚动视图同时进行使用"),
                           ];
    
    NSArray *array = @[@"finditem_ad.png",
                       @"finditem_hotpeople.png",
                       @"finditem_hotsound.png",
                       @"finditem_newpeople.png",
                       @"finditem_newsound.png",
                       @"finditem_wallspoint.png"];
    
    self.imageArray = [NSArray arrayWithArray:array];
    
    self.width = 145;
    self.height = 145;
    
    self.indexImage = 0;
    
    [self notifyToRefresh];
}

-(NSString*)getImageName:(NSInteger)index{
    return [self.imageArray safeObjectAtIndex:index];
}

-(void)changeIndexImage{
    self.indexImage++;
    if(self.indexImage == [self.imageArray count]){
        self.indexImage = 0;
    }
}

-(NSInteger)getPageNumByOffSet:(UIScrollView*)scrollView{
    CGPoint offset = scrollView.contentOffset;
    return offset.x / self.width;
}

@end
