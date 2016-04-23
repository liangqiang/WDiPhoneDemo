//
//  IphoneDemoListTableViewCell.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y000TableViewCell.h"

@interface Y000TableViewCell ()
@property (nonatomic,strong) UILabel *indexLabel;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *bottomLine;
@end

@implementation Y000TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initContentView];
    }
    return self;
}

-(void)initContentView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.indexLabel = [UILabel newWith:kFont16B, kWhiteColor, @"标题", @(NSTextAlignmentCenter), nil];
    self.indexLabel.backgroundColor = kPrimaryColor;
    
    self.titleLabel = [UILabel newWith:kFont14, kLightBlackColor, @"标题", @(NSTextAlignmentLeft), nil];
    self.bottomLine = [UIView newWith:kLightGrayColor, nil];

    [self.contentView addSubviews:self.indexLabel, self.titleLabel, self.bottomLine, nil];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.indexLabel.width = 60;
    [self.indexLabel layoutWithInsets:UIEdgeInsetsMake(0, 0, 0, EAuto)];
    
    NSInteger titleLabelLeft = self.indexLabel.width + 15;
    [self.titleLabel layoutWithInsets:UIEdgeInsetsMake(0, titleLabelLeft, 0, 0)];
    
    self.bottomLine.height = LINE_HEIGHT;
    [self.bottomLine layoutWithInsets:UIEdgeInsetsMake(EAuto, 0, 0, 0)];
}

-(void)updateWithItem:(AJNormalItem*)cellItem{
    self.indexLabel.text = [cellItem.title substringToIndex:4];
    self.titleLabel.text = [cellItem.title substringFromIndex:5];
    
    [self setNeedsLayout];
}

@end
