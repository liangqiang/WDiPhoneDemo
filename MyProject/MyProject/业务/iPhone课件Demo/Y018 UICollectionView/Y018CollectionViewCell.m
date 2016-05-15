//
//  Y018CollectionViewCell.m
//  MyProject
//
//  Created by caoyang on 16/5/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y018CollectionViewCell.h"

@implementation Y018CollectionViewCell

-(id)initWithFrame:(CGRect)frame;{
    if(self = [super initWithFrame:frame]){
        CGFloat color1 = (arc4random()%255);
        CGFloat color2 = (arc4random()%255);
        CGFloat color3 = (arc4random()%255);
        
        UIColor* color = [UIColor colorWithRed:(color1/ 255.0) green:(color2/255.0) blue:(color3/255.0) alpha:1.0f];
        
        self.backgroundColor = color;
        
        //移除cell
        for (id subView in self.contentView.subviews) {
            [subView removeFromSuperview];
        }
    }
    return self;
}

-(void)cellHeightAtHArr:(NSMutableArray*)hArr row:(NSInteger)row;{
    NSInteger remainder = row % colletionCell;
    NSInteger currentRow = row/colletionCell;
    CGFloat   currentHeight=[[hArr safeObjectAtIndex:row] floatValue];
    
    CGFloat positonX=(screenWidth/colletionCell-8)*remainder+5*(remainder+1);
    CGFloat positionY=(currentRow+1)*5;
    for (NSInteger i=0; i<currentRow; i++) {
        NSInteger position=remainder+i*colletionCell;
        positionY+=[[hArr safeObjectAtIndex:position] floatValue];
    }
    self.frame = CGRectMake(positonX, positionY,screenWidth/colletionCell-8,currentHeight) ;//重新定义cell位置、宽高
}

@end
