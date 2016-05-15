//
//  Y017_1CellFrameModel.h
//  MyProject
//
//  Created by caoyang on 16/5/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Y017_1MessageModel;

#define textPadding 15

@interface Y017_1CellFrameModel : NSObject

@property (nonatomic, strong) Y017_1MessageModel *message;

@property (nonatomic, assign) CGRect timeFrame;
@property (nonatomic, assign) CGRect iconFrame;
@property (nonatomic, assign) CGRect textFrame;
@property (nonatomic, assign) CGFloat cellHeght;

@end
