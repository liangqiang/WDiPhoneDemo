//
//  Y001ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y001ViewController.h"

@interface Y001ViewController ()
@property BOOL isSelected;
@end

@implementation Y001ViewController

-(instancetype)init{
    if (self=[super init]) {
        self.title = @"Iphone课件001";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self NormalButton];
    
    [self StyleButton1];
    
    [self StyleButton2];
    
    [self StyleButton3];
}

//创建默认的文字button，响应点击事件
-(void)NormalButton{
    
    UIButton* normalBtn = [[UIButton alloc]init];
    //设置按钮在手机上的位置
    [normalBtn setFrame:CGRectMake(100, 60, 120, 44)];
    //设置按钮的显示标签
    [normalBtn setTitle:@"点我吧" forState:UIControlStateNormal];
    //设置按钮的背景颜色
    [normalBtn setBackgroundColor:[UIColor grayColor]];
    //添加按钮的触摸事件(按钮按下)
    [normalBtn addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    //按钮添加到当前视图
    [self.view addSubview:normalBtn];
}

//点击按钮触发的方法
-(void)ClickBtn:(id)sender{
    [AJUtil toast:@"NormalClick"];
}


//不同状态（默认、选中、高亮、禁用）下，button的文字（字体颜色）、背景图（包括checkbox）
-(void)StyleButton1{
    UIButton* normalBtn = [[UIButton alloc]init];
    //设置按钮在手机上的位置
    [normalBtn setFrame:CGRectMake(130, 150, 60, 62)];
    
    //设置字体大小
    normalBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    
    //设置按钮的显示标签
    [normalBtn setTitle:@"来点我" forState:UIControlStateNormal];
    [normalBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [normalBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [normalBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
    [normalBtn setTitleColor:[UIColor blueColor] forState:UIControlStateDisabled];
    
    //设置按钮背景图片
    [normalBtn setBackgroundImage:[UIImage imageNamed:@"title1.png"] forState:UIControlStateNormal];
    [normalBtn setBackgroundImage:[UIImage imageNamed:@"title2.png"] forState:UIControlStateHighlighted];
    [normalBtn setBackgroundImage:[UIImage imageNamed:@"title3.png"] forState:UIControlStateSelected];
    [normalBtn setBackgroundImage:[UIImage imageNamed:@"title4.png"] forState:UIControlStateDisabled];
    
    [normalBtn addTarget:self action:@selector(ClickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:normalBtn];
}

-(void)ClickBtn1:(id)sender{
    [AJUtil toast:@"StyleAClick"];
}

-(void)StyleButton2{
    _isSelected = NO;
    
    UIButton* normalBtn = [[UIButton alloc]init];
    //设置按钮在手机上的位置
    [normalBtn setFrame:CGRectMake(130, 220, 45, 45)];
    
    //setImage和setBackGroundImage区别：前不会拉伸，会做遮挡、后会拉伸，不会遮挡
    [normalBtn setImage:[UIImage imageNamed:@"right1.png"] forState:UIControlStateNormal];
    
    [normalBtn addTarget:self action:@selector(ClickBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:normalBtn];
}

-(void)ClickBtn2:(id)sender{
    UIButton* normalBtn = (UIButton*)sender;
    
    if (_isSelected) {
        _isSelected = NO;
        [normalBtn setImage:[UIImage imageNamed:@"right1.png"] forState:UIControlStateNormal];
        [AJUtil toast:@"remember password"];
    }else{
        _isSelected = YES;
        [normalBtn setImage:[UIImage imageNamed:@"right2.png"] forState:UIControlStateNormal];
        [AJUtil toast:@"unremember password"];
    }
}


//带小图片的button，可以调整图片、文字位置
-(void)StyleButton3{
    UIButton* theButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 290, 220, 100)];
    [theButton setBackgroundColor:[UIColor grayColor]];
    
    NSString* str = @"中华人民共和国";
    [theButton setTitle:str forState:UIControlStateNormal];
    //文字
    //上中下
    theButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //左中右
    theButton. contentHorizontalAlignment =UIControlContentHorizontalAlignmentCenter;
    //上左下右
    //theButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 20, 10);
    
    //图标
    [theButton setImage:[UIImage imageNamed:@"title4.png"] forState:UIControlStateNormal];
    [theButton setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 65)];
    
    [theButton addTarget:self action:@selector(ClickBtn3) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:theButton];
}

-(void)ClickBtn3{
    [AJUtil toast:@"ImageTextClick"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
