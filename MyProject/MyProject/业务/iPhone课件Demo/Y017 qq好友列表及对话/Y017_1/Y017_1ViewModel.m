//
//  Y017_1ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y017_1ViewModel.h"
#import "Y017_1MessageModel.h"
#import "Y017_1CellFrameModel.h"

@implementation Y017_1ViewModel

-(void)loadData{
    
    self.cellFrameDatas =[NSMutableArray array];
    NSURL *dataUrl = [[NSBundle mainBundle] URLForResource:@"Y017_1Messages.plist" withExtension:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfURL:dataUrl];
    
    for (NSDictionary *dict in dataArray) {
        Y017_1MessageModel *message = [Y017_1MessageModel messageModelWithDict:dict];
        Y017_1CellFrameModel *lastFrame = [_cellFrameDatas lastObject];
        Y017_1CellFrameModel *cellFrame = [[Y017_1CellFrameModel alloc] init];
        message.showTime = ![message.time isEqualToString:lastFrame.message.time];
        cellFrame.message = message;
        [self.cellFrameDatas addObject:cellFrame];
    }
    
    [self notifyToRefresh];
}

-(NSInteger)cellCount{
    return self.cellFrameDatas.count;
}

-(CGFloat)cellHeightAtRow:(NSInteger)row{
    Y017_1CellFrameModel *theCellFrame = self.cellFrameDatas[row];
    return theCellFrame.cellHeght;
}

-(Y017_1CellFrameModel*)cellFrameModelAtRow:(NSInteger)row{
    return [self.cellFrameDatas safeObjectAtIndex:row];
}


@end
