//
//  Y021ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"

@interface Y021ViewModel : YScrollViewModel<NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *newsList;
@property (nonatomic, strong) NSMutableString *currentString;
@property (nonatomic, strong) NSMutableDictionary *dictionary;


@property (nonatomic, strong) NSMutableArray *cityArray;

- (void) onXMLParse;

- (void) onJsonParse;

@end
