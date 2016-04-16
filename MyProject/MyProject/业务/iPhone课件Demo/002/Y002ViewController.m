//
//  Y002ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y002ViewController.h"

@interface Y002ViewController ()

@end

@implementation Y002ViewController


-(instancetype)init{
    if (self=[super init]) {
        self.title = @"Iphone课件002";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self LabelA];
    [self LabelB];
}

//单行文本，设置文字字体、颜色、对齐，截取方式
-(void)LabelA{
    UILabel* firstLa = [[UILabel alloc]init];
    firstLa.frame = CGRectMake(40, 100, 240, 30);
    //背景颜色
    firstLa.backgroundColor = [UIColor grayColor];
    //显示文本
    firstLa.text = @"中华人民共和国万岁,起来，起来，呜哈哈哈";
    //字体颜色
    firstLa.textColor = [UIColor orangeColor];
    //字体大小
    firstLa.font = [UIFont systemFontOfSize:15.0f];
    //对齐方式
    firstLa.textAlignment = NSTextAlignmentCenter;
    
    //超出label边界文字的截取方式
    firstLa.lineBreakMode = UILineBreakModeTailTruncation;
    
    //截取方式有以下6种
    //typedef enum {
    // UILineBreakModeWordWrap = 0, 以空格为边界，保留整个单词
    // UILineBreakModeCharacterWrap, 保留整个字符
    // UILineBreakModeClip, 到边界为止
    // UILineBreakModeHeadTruncation, 省略开始，以……代替
    // UILineBreakModeTailTruncation, 省略结尾，以……代替
    // UILineBreakModeMiddleTruncation,省略中间，以……代替，多行时作用于最后一行
    //} UILineBreakMode;
    
    [self.view addSubview:firstLa];
}

//多行文本，计算大小
-(void)LabelB{
    NSString* str = @"不管别人说的多么难听，现在我拥有的事情是你，我喜欢你是我独家记忆，有关于你绝口不提!";
    UILabel* firstLa = [[UILabel alloc]init];
    firstLa.backgroundColor = [UIColor grayColor];
    
    firstLa.text = str;
    firstLa.numberOfLines = 0;
    
    UIFont *font = [UIFont fontWithName:@"Arial" size:14];
    firstLa.font = font;
    
    CGSize size = CGSizeMake(160, CGFLOAT_MAX);
    CGSize labelsize = [str sizeWithFont:font constrainedToSize:size lineBreakMode:firstLa.lineBreakMode];
    firstLa.frame = CGRectMake(60, 200, 200, labelsize.height);
    [self.view addSubview:firstLa];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
