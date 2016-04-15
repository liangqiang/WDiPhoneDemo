//
//  IphoneDemoListTableViewCell.m
//  MyProject
//
//  Created by caoyang on 16/4/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "IphoneDemoListTableViewCell.h"
#import "WDButtonItem.h"

@interface IphoneDemoListTableViewCell ()
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation IphoneDemoListTableViewCell

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

-(void)updateWithItem:(WDButtonItem*)cellItem{
    self.titleLabel.text = cellItem.title;
}

@end
