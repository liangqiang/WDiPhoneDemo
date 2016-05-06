//
//  Y012TableViewCell.m
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y012_3TableViewCell.h"

@implementation Y012_3TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 60, 20)];
        self.sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 5, 60, 20)];
        self.picImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 45, 45)];
        self.enjoyLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 230, 20)];
        
        [self.contentView addSubviews:self.nameLabel,self.sexLabel,self.picImageView,self.enjoyLabel, nil];
    }
    return self;
}

@end
