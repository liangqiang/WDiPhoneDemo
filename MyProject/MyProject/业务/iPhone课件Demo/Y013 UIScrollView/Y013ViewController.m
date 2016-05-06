//
//  Y013ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/3.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y013ViewController.h"
#import "Y013ViewModel.h"

@interface Y013ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)Y013ViewModel *viewModel;
@property(nonatomic,strong)UIScrollView *scrollView;

//超级大图
@property(nonatomic,strong)UIImageView* bigImageView;
//时间轮播图片
@property(nonatomic,strong)UIScrollView *timeScrollView;
@property(nonatomic,strong)UIScrollView *pageScrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@end

@implementation Y013ViewController

//1、用滑动控件显示一个非常大的图片、显示大小、内容大小、增加滚动区域
-(UIScrollView*)createScrollViewBigImage{
    UIScrollView* bigScrollView = [UIScrollView new];
    
    // 增加额外的滚动区域（逆时针，上、左、下、右）
    // top  left  bottom  right
    bigScrollView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    self.bigImageView = [self createBigImageView];
    [bigScrollView addSubview:self.bigImageView];
    
    //设置滚动视图的大小
    bigScrollView.size = CGSizeMake(self.scrollView.width, 200);
    //设置滚动视图的内容大小
    bigScrollView.contentSize = self.bigImageView.image.size;
    
    return bigScrollView;
}

-(UIImageView*)createBigImageView{
    UIImage *image = [UIImage imageNamed:@"minion.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    return imageView;
}


//2、一个基本的滑动控件(展示多张图片、垂直、回弹、偏移)
-(UIScrollView*)createScrollViewNormal{
    UIScrollView* normalScrollView = [UIScrollView new];
    
    //设置可见大小、显示内容大小
    normalScrollView.size = CGSizeMake(145, 145);
    normalScrollView.contentSize = CGSizeMake(145*[self.viewModel.imageArray count], 145);
    
    //所有图片添加到滚动视图中
    for(int i=0;i<[self.viewModel.imageArray count];i++){
        UIImage *image = [self.viewModel.imageArray safeObjectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(145*i, 0, 145, 145);
        [normalScrollView addSubview:imageView];
    }
    
    //水平垂直标
    normalScrollView.showsHorizontalScrollIndicator = YES;
    normalScrollView.showsVerticalScrollIndicator = YES;
    
    //回弹效果，整页偏移
    normalScrollView.bounces = YES;
    normalScrollView.pagingEnabled = YES;
    
    return normalScrollView;
}


//3、时间循环播放图片展示
-(UIScrollView*)createScrollViewTimer{
    UIScrollView* timeScrollView = [self createScrollViewNormal];
    
    //创建时间定时器
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    self.timeScrollView = timeScrollView;
    
    return timeScrollView;
}

-(void)changeImage{
    [self.viewModel changeIndexImage];
    
    [self.timeScrollView scrollRectToVisible:CGRectMake(145 * self.viewModel.indexImage, 0, 145, 145) animated:YES];
}


//4、联合展示图片、标记滑动到第几个选项
-(UIView*)createScrollViewPageController{
    
    UIScrollView* pageScrollView = [self createScrollViewNormal];
    pageScrollView.delegate = self;
    self.pageScrollView = pageScrollView;
    
    UIView *view = [UIView new];
    view.size = pageScrollView.size;

    
    self.pageControl = [self createPageController];
    [view addSubviews:self.pageScrollView, self.pageControl, nil];
    [self.pageControl layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, 0, EAuto)];
    
    return view;
}

-(UIPageControl*)createPageController{
    UIPageControl *pageControl = [UIPageControl new];
    pageControl.size = CGSizeMake(self.scrollView.width-200, 15);
    pageControl.numberOfPages=[self.viewModel.imageArray count]; //设置页数
    pageControl.currentPage=0; //初始页码为 0
    pageControl.userInteractionEnabled=NO;
    
    return pageControl;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(scrollView==self.pageScrollView){
        //计算当前的页码
        self.pageControl.currentPage = [self getPageNumByOffSet:scrollView];
    }
}

-(NSInteger)getPageNumByOffSet:(UIScrollView*)scrollView{
    CGPoint offset = scrollView.contentOffset;
    return offset.x / 145;
}


@end
