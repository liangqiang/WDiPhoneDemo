//
//  Y012TableViewCell2.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_4TableViewCell.h"

@interface Y012_4TableViewCell ()
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *sexLabel;
@property (nonatomic,strong) UILabel *ageLabel;
@property (nonatomic,strong) UIView *bottomLine;
@end

@implementation Y012_4TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initContentView];
    }
    return self;
}

-(void)initContentView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.nameLabel = [UILabel newWith:kFont16B, kWhiteColor, @"标题", @(NSTextAlignmentCenter), nil];
    self.nameLabel.backgroundColor = kPrimaryColor;
    
    self.sexLabel = [UILabel newWith:kFont14, kLightBlackColor, @"标题", @(NSTextAlignmentLeft), nil];
    self.ageLabel = [UILabel newWith:kFont14, kLightBlackColor, @"标题", @(NSTextAlignmentLeft), nil];
    self.bottomLine = [UIView newWith:kBlackColor, nil];
    
    [self.contentView addSubviews:self.nameLabel, self.sexLabel, self.ageLabel, self.bottomLine, nil];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.nameLabel.width = 60;
    [self.nameLabel layoutWithInsets:UIEdgeInsetsMake(0, 0, 0, EAuto)];
    
    self.sexLabel.width = 40;
    NSInteger nameLabelLeft = self.nameLabel.width + 15;
    [self.sexLabel layoutWithInsets:UIEdgeInsetsMake(0, nameLabelLeft, 0, EAuto)];

    NSInteger ageLabelLeft = self.nameLabel.width+self.sexLabel.width+30;
    [self.ageLabel layoutWithInsets:UIEdgeInsetsMake(0, ageLabelLeft, 0, 0)];
    
    self.bottomLine.height = LINE_HEIGHT;
    [self.bottomLine layoutWithInsets:UIEdgeInsetsMake(EAuto, 0, 0, 0)];
}

-(void)updateWithItem:(AJNormalItem1*)cellItem{
    
    self.nameLabel.text = cellItem.name;
    self.sexLabel.text = cellItem.sex;
    self.ageLabel.text = cellItem.age;
    
    [self setNeedsLayout];
}

@end
