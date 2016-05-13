//
//  Y017TableViewCell.m
//  MyProject
//
//  Created by caoyang on 16/5/13.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017TableViewCell.h"

@interface Y017TableViewCell ()
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
    self.titleLabel = [UILabel newWith:kFont16B, kWhiteColor, @"标题", @(NSTextAlignmentCenter), nil];
    self.titleLabel.backgroundColor = kPrimaryColor;
    
    self.bottomLine = [UIView newWith:kBlackColor, nil];
    
    [self.contentView addSubviews:self.titleLabel, self.bottomLine, nil];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.width = 60;
    [self.titleLabel layoutWithInsets:UIEdgeInsetsMake(0, 0, 0, EAuto)];
    
    self.bottomLine.height = LINE_HEIGHT;
    [self.bottomLine layoutWithInsets:UIEdgeInsetsMake(EAuto, 0, 0, 0)];
}




@end
