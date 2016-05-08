//
//  Y016_4ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y016_4ViewController.h"
#import "Y016_4ViewModel.h"

@interface Y016_4ViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) Y016_4ViewModel *viewModel;
@property (nonatomic,strong) UIImageView *imageViewSimple;

@end

@implementation Y016_4ViewController

-(UIView*)createImageNormal{
    UIImageView *imageView = [UIImageView new];
    imageView.size = CGSizeMake(120, 120);
    [imageView setImage:[UIImage imageNamed:@"xing.png"]];
    
    self.imageViewSimple = imageView;
    return imageView;
}

@end
