//
//  Y017_1TableViewCell.m
//  MyProject
//
//  Created by caoyang on 16/5/13.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017_1TableViewCell.h"

#import "Y017_1CellFrameModel.h"
#import "Y017_1MessageModel.h"
#import "UIImage+Y017_1ResizeImage.h"

@interface Y017_1TableViewCell()
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIButton *textView;
@end

@implementation Y017_1TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundView = nil;
        self.backgroundColor = [UIColor clearColor];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        self.timeLabel.textColor = [UIColor grayColor];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        
        self.iconView = [[UIImageView alloc] init];
        
        self.textView = [UIButton buttonWithType:UIButtonTypeCustom];
        self.textView.titleLabel.numberOfLines = 0;
        self.textView.titleLabel.font = [UIFont systemFontOfSize:13];
        self.textView.contentEdgeInsets = UIEdgeInsetsMake(textPadding, textPadding, textPadding, textPadding);
        
        [self.contentView addSubviews:self.timeLabel,self.iconView,self.textView, nil];
    }
    return self;
}

-(void)cellFrameRow:(Y017_1CellFrameModel*)cellFrameModel{
    self.timeLabel.frame = cellFrameModel.timeFrame;
    self.timeLabel.text = cellFrameModel.message.time;
    
    self.iconView.frame = cellFrameModel.iconFrame;
    NSString *iconStr = cellFrameModel.message.type ? @"other" : @"me";
    self.iconView.image = [UIImage imageNamed:iconStr];
    
    self.textView.frame = cellFrameModel.textFrame;
    NSString *textBg = cellFrameModel.message.type ? @"chat_recive_nor" : @"chat_send_nor";
    UIColor *textColor = cellFrameModel.message.type ? [UIColor blackColor] : [UIColor whiteColor];
    [self.textView setTitleColor:textColor forState:UIControlStateNormal];
    [self.textView setBackgroundImage:[UIImage resizeImage:textBg] forState:UIControlStateNormal];
    [self.textView setTitle:cellFrameModel.message.text forState:UIControlStateNormal];
}

@end
