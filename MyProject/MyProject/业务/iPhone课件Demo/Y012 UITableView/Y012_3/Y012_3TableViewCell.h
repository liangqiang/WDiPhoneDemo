//
//  Y012TableViewCell.h
//  MyProject
//
//  Created by caoyang on 16/5/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Y012_3PersonItem;

@interface Y012_3TableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *sexLabel;
@property(nonatomic,strong)UIImageView *picImageView;
@property(nonatomic,strong)UILabel *enjoyLabel;

-(void)itemData:(Y012_3PersonItem*)item;

@end
