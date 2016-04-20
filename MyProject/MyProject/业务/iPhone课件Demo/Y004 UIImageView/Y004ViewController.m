//
//  Y004ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/18.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y004ViewController.h"
#import "Y004ViewModel.h"

@interface Y004ViewController ()
@property(nonatomic,strong) Y004ViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;
@end

@implementation Y004ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Y004 UIImageView";
    
    self.scrollView = [self createScrollView];
    [self.view addSubview:self.scrollView];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.scrollView removeAllSections];
    
    for (NSString *viewType in self.viewModel.viewTypeArray) {
        UIView *hintSection = [self createHintSectionWithViewType:viewType];
        [self.scrollView addSection:hintSection];
        
        UIView *section = [UIView newWith:[UIColor clearColor], nil];
        NSString *selector = [NSString stringWithFormat:@"create%@", viewType];
        UIView *subview = [AJUtil performSelector:NSSelectorFromString(selector) onTarget:self];
        
        [section addSubview:subview];
        section.size = CGSizeMake(self.scrollView.width, subview.height + 20);
        [subview layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, EAuto, EAuto)]; // 定位
        
        [self.scrollView addSection:section];
    }
}
-(UIView*)createHintSectionWithViewType:(NSString*)viewType{
    NSDictionary *dict = @{@"ImageViewSimple": @"显示图片，缩放（原比例）",
                           @"ImageViewTouch": @"点击事件（手势）",
                           @"ImageViewGif":@"gif动画"
                           };
    NSString *hint = [dict safeObjectFortKey:viewType];
    
    UILabel *label = [UILabel newWith: kFont12, kLightBlackColor, hint, nil];
    [label sizeToFit];
    
    UIView *section = [UIView newWith:[UIColor clearColor], nil];
    [section addSubview:label];
    section.size = CGSizeMake(self.scrollView.width, label.height + 10);
    [label layoutWithInsets:UIEdgeInsetsMake(EAuto, 15, EAuto, EAuto)]; // 定位
    
    return section;
}

//显示图片，缩放（原比例）
-(UIImageView*)createImageViewSimple{
    UIImageView *imageView = [UIImageView new];
    
    imageView.size = CGSizeMake(self.scrollView.width - 200, 44);
    
    imageView.backgroundColor = kLightGrayColor;
    
    [imageView setImage:AJIconFontSmile];
    //设置图片原比例展示
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    return imageView;
}

//点击事件（手势）
-(UIImageView*)createImageViewTouch{
    UIImageView *imageViewTouch = [self createImageViewSimple];
    
    //设置图片空间的展示图片
    [imageViewTouch setImage:AJIconFontSelected];
    
    //设置空间的背景颜色
    imageViewTouch.backgroundColor = kLightGrayColor;
    
    //用户交互、设置单击、注册点击事件
    imageViewTouch.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onNormalImageClick:)];
    [imageViewTouch addGestureRecognizer:singleTap];
    
    return imageViewTouch;
}
-(void)onNormalImageClick:(id)sender{
    [self.viewModel onImageClicked:@"图片控件被点"];
}

//gif动画
-(UIImageView*)createImageViewGif{
    UIImageView *imageViewGif = [self createImageViewSimple];
    
    //循环播放的资源
    imageViewGif.animationImages = [NSArray arrayWithObjects:
                                         AJIconFontSmile,
                                         AJIconFontUnselected,
                                         AJIconFontSmileHL,
                                         AJIconFontSelected,
                                         nil];
    //动画播放时间
    imageViewGif.animationDuration = 4.0f;
    
    //动画重复次数
    imageViewGif.animationRepeatCount = 0;
    
    //开始播放图片动画
    [imageViewGif startAnimating];
    
    return imageViewGif;
}

@end
