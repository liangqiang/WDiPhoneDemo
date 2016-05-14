//
//  Y017SectionView.m
//  MyProject
//
//  Created by caoyang on 16/5/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017SectionView.h"

@implementation Y017SectionView


-(id)initWithTag:(NSInteger)tag andImage:(UIImage*)image andTitle:(NSString*)title{
    if(self = [super init]){
        self.size = CGSizeMake(self.size.width, 30);
        self.backgroundColor =[UIColor whiteColor];
        self.tag = tag;
        
        UIImageView *listImage = [[UIImageView alloc] init];
        NSInteger imageHeight = (self.size.height-10)/2;
        listImage.width = 10;
        listImage.height = 10;
        listImage.frame = CGRectMake(10, imageHeight, listImage.width, listImage.height);
        listImage.image = image;
        [self addSubview:listImage];
        
        UILabel *tileLabel = [[UILabel alloc] init];
        tileLabel.width = 80;
        tileLabel.frame = CGRectMake(listImage.width+20, 0, tileLabel.width, self.size.height);
        [self addSubview:tileLabel];
        tileLabel.text = title;
    }
    
    return self;
}

@end
