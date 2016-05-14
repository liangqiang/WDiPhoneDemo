//
//  Y017TableViewCell.m
//  MyProject
//
//  Created by caoyang on 16/5/13.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017TableViewCell.h"
#import "Y017ViewModel.h"

@interface Y017TableViewCell ()
@property (nonatomic,strong) Y017ViewModel *viewModel;
@property (nonatomic,strong) UIImageView *picImage;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *bottomLine;
@end

@implementation Y017TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initContentView];
    }
    return self;
}

-(void)initContentView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.separatorInset = UIEdgeInsetsZero;
    self.clipsToBounds = YES;
    
    self.picImage = [UIImageView newWith:kBlackColor, nil];
    
    self.titleLabel = [UILabel newWith:kFont16B, kWhiteColor, @"标题", @(NSTextAlignmentCenter), nil];
    self.titleLabel.backgroundColor = kPrimaryColor;
    
    self.bottomLine = [UIView newWith:kBlackColor, nil];
    
    [self.contentView addSubviews:self.picImage,self.titleLabel, self.bottomLine, nil];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.picImage.width = 30;
    [self.picImage layoutWithInsets:UIEdgeInsetsMake(0, 10, 0, EAuto)];
    
    self.titleLabel.width = 80;
    NSInteger titleLabelLeft = self.picImage.width + 20;
    [self.titleLabel layoutWithInsets:UIEdgeInsetsMake(5, titleLabelLeft, 5, EAuto)];
    
    self.bottomLine.height = LINE_HEIGHT;
    [self.bottomLine layoutWithInsets:UIEdgeInsetsMake(EAuto, 0, 0, 0)];
}

-(void)updateItem:(NSString*)name{
    self.picImage.image = [UIImage imageNamed:@"xing.png"];
    self.titleLabel.text = name;
}

@end
