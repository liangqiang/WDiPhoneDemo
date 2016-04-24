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

@property (nonatomic,strong) UIImageView *imageViewSimple;
@property (nonatomic,strong) UILabel *contentModeLabel;
@end

@implementation Y004ViewController

//显示图片，缩放（原比例）
-(UIView*)createImageViewSimple{
    UIImageView *imageView = [UIImageView new];
    imageView.size = CGSizeMake(self.scrollView.width - 200, self.scrollView.width - 200);
    imageView.backgroundColor = kLightGrayColor;
    [imageView setImage:[UIImage imageNamed:@"image01.jpg"]];
    imageView.clipsToBounds = YES;
    
    //设置图片原比例展示
    [imageView setContentMode:UIViewContentModeScaleAspectFit]; //缩放，维持长宽比
    
    //用户交互、设置单击、注册点击事件
    imageView.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onImageViewSimpleClicked:)];
    [imageView addGestureRecognizer:singleTap];
    
    self.imageViewSimple = imageView;
    return imageView;
}

-(void)onImageViewSimpleClicked:(UITapGestureRecognizer*)sender{
    UIImageView *imageView = (UIImageView*)sender.view;
    
    NSArray *modes = @[@(UIViewContentModeScaleToFill),
                       @(UIViewContentModeScaleAspectFit),
                       @(UIViewContentModeScaleAspectFill),
                       @(UIViewContentModeCenter),
                       @(UIViewContentModeTopLeft)];
    
    NSInteger index = [modes indexOfObject:@(imageView.contentMode)];
    NSInteger nextIndex = index==modes.count-1 ? 0 : index+1;
    imageView.contentMode = [[modes objectAtIndex:nextIndex] integerValue];
    [self updateContentMode];
}

-(UIView*)createLabelContentModel{
//    NSString *text = @"UIViewContentModeScaleAspectFit \n 缩放，维持长宽比";
    UILabel *label = [UILabel newWith:kFont14, kLightBlackColor, @"", @(NSTextAlignmentCenter), nil];
    label.size = CGSizeMake(self.scrollView.width-30, 40);
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 2;
    
    self.contentModeLabel = label;
    [self updateContentMode];
    return label;
}

-(void)updateContentMode{
    if (self.imageViewSimple.contentMode == UIViewContentModeScaleToFill) {
        self.contentModeLabel.text = @"UIViewContentModeScaleToFill \n 缩放，拉伸，充满";
    }
    else if (self.imageViewSimple.contentMode == UIViewContentModeScaleAspectFit) {
        self.contentModeLabel.text = @"UIViewContentModeScaleAspectFit \n 缩放，保持宽高比";
    }
    else if (self.imageViewSimple.contentMode == UIViewContentModeScaleAspectFill) {
        self.contentModeLabel.text = @"UIViewContentModeScaleAspectFill \n 缩放，保持宽高比，充满";
    }
    else if (self.imageViewSimple.contentMode == UIViewContentModeCenter) {
        self.contentModeLabel.text = @"UIViewContentModeCenter \n 不缩放，居中";
    }
    else if (self.imageViewSimple.contentMode == UIViewContentModeTopLeft) {
        self.contentModeLabel.text = @"UIViewContentModeTopLeft \n 不缩放，左上";
    }
}

// 多帧动画
-(UIImageView*)createImageViewFrames{
    UIImageView *imageView = [UIImageView new];
    imageView.size = CGSizeMake(50, 50);
    
    //循环播放的资源
    imageView.animationImages = [NSArray arrayWithObjects:
                                    AJIconFontSmile1,
                                    AJIconFontSmile2,
                                    AJIconFontSmile3,
                                    AJIconFontSmile4,
                                    AJIconFontSmile5,
                                    AJIconFontSmile6,
                                    nil];
    //动画播放时间
    imageView.animationDuration = 4.0f;
    
    //动画重复次数
    imageView.animationRepeatCount = 0;
    
    //开始播放图片动画
    [imageView startAnimating];
    
    return imageView;
}

// 播放gif动画（webView）
-(UIView*)createImageViewGif{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    webView.scalesPageToFit = YES;
    webView.userInteractionEnabled = NO;//用户不可交互
    NSString *path = [[NSBundle mainBundle] pathForResource:@"run" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    
// 去除编译警告：null passed to a callee which requires a non-null argument
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
#pragma clang diagnostic pop

    [self.view addSubview:webView];

    return webView;
}


@end
