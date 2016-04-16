//
//  IphoneDemoListTableViewCell.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y000TableViewCell.h"

@interface Y000TableViewCell ()
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation Y000TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initContentView];
    }
    return self;
}

-(void)initContentView{
    self.titleLabel = [UILabel newWith:kFont14, kLightBlackColor, @"标题", @(NSTextAlignmentCenter), nil];
    [self.contentView addSubview:self.titleLabel];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleLabel layoutWithInsets:UIEdgeInsetsZero];
}

-(void)updateWithItem:(AJNormalItem*)cellItem{
    self.titleLabel.text = cellItem.title;
}

@end
