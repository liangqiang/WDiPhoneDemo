//
//  Y016_3ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/8.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y016_3ViewController.h"
#import "Y016_3ViewModel.h"

@interface Y016_3ViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) Y016_3ViewModel *viewModel;
@property (nonatomic,strong) UIImageView *imageViewSimple;

@end

@implementation Y016_3ViewController

-(UIView*)createImageNormal{
    UIImageView *imageView = [UIImageView new];
    imageView.size = CGSizeMake(120, 120);
    [imageView setImage:[UIImage imageNamed:@"zhang.png"]];
    
    self.imageViewSimple = imageView;
    return imageView;
}

@end
