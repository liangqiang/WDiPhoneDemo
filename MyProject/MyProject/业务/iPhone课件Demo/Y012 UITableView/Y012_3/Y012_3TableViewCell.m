//
//  Y012TableViewCell.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_3TableViewCell.h"
#import "Y012_3PersonItem.h"

@implementation Y012_3TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.nameLabel = [[UILabel alloc] init];
        self.sexLabel = [[UILabel alloc] init];
        self.picImageView = [[UIImageView alloc]init];
        self.enjoyLabel = [[UILabel alloc] init];
        
        [self.contentView addSubviews:self.nameLabel,self.sexLabel,self.picImageView,self.enjoyLabel, nil];
    }
    return self;
}

//调用基类方法用来设置cell中子空间的大小
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.picImageView.width = 45;
    self.picImageView.height = 45;
    [self.picImageView layoutWithInsets:UIEdgeInsetsMake(10, 10, 10, EAuto)];
    
    self.nameLabel.width = 60;
    NSInteger imageleft = self.picImageView.width+30;
    [self.nameLabel layoutWithInsets:UIEdgeInsetsMake(5, imageleft, 40, EAuto)];
    
    self.sexLabel.width = 60;
    NSInteger nameLabelLeft = self.nameLabel.width + self.picImageView.width + 45;
    [self.sexLabel layoutWithInsets:UIEdgeInsetsMake(5, nameLabelLeft, 40, EAuto)];
    
    self.enjoyLabel.width = 230;
    NSInteger sexLabelLeft = self.picImageView.width+30;
    [self.enjoyLabel layoutWithInsets:UIEdgeInsetsMake(30, sexLabelLeft, 0, EAuto)];
}

-(void)itemData:(Y012_3PersonItem*)item{
    self.nameLabel.text = item.name;
    self.sexLabel.text = item.sex;
    self.enjoyLabel.text = item.enjoy;
    self.picImageView.image = AJIconFontSmile;
}

@end
