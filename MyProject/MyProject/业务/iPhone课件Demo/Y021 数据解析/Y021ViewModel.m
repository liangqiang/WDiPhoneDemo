//
//  Y021ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y021ViewModel.h"

@implementation Y021ViewModel

- (void) loadData{
    self.viewTypeArray = @[VIEWTYPE(@"XMLNormal", @"基本的xml数据解析"),
                           VIEWTYPE(@"JsonNormal", @"基本的Json数据解析"),
                           ];
    
    [self notifyToRefresh];
}

- (void) onXMLParse{
    self.newsList = [[NSMutableArray alloc] initWithCapacity:5];
    self.currentString = [[NSMutableString alloc] initWithCapacity:5];
    self.dictionary = [[NSMutableDictionary alloc] initWithCapacity:3];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"xml"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    //实例化一个解析器(SAX解析器)
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
    parser.delegate = self;
    [parser parse];//开始解析
}
#pragma mark NSXMLParserDelegate
//开始解析文档
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    //清空数组
    [self.newsList removeAllObjects];
}

//当遇到“开始标签”时调用该方法
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    [self.currentString setString:@""];
}
//遇到"开始标签"和"结束标签"之间的内容时调用该方法
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [self.currentString appendString:string];
}

//当遇到“结束标签”时调用该方法
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"title"]) {
        [self.dictionary setObject:[NSString stringWithString:_currentString] forKey:@"title"];
    }else  if ([elementName isEqualToString:@"link"]) {
        [self.dictionary setObject:[NSString stringWithString:_currentString] forKey:@"link"];
    }else  if ([elementName isEqualToString:@"description"]) {
        [self.dictionary setObject:[NSString stringWithString:_currentString] forKey:@"description"];
    }else  if ([elementName isEqualToString:@"item"]) {
        [self.newsList addObject:[NSDictionary dictionaryWithDictionary:_dictionary]];
    }
}

//解析文档结束
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSMutableString *newStr = [[NSMutableString alloc] init];
    for (id newDic in self.newsList){
        NSString *newTitle = [newDic objectForKey:@"title"];
        [newStr appendFormat:@" %@",newTitle];
    }
    
    [AJUtil toast:newStr];
}



- (void) onJsonParse{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"city.txt" ofType:nil];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    id obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    BOOL isValid = [NSJSONSerialization isValidJSONObject:obj];
    if (isValid) {
        if (obj && [obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = (NSDictionary*)obj;
            self.cityArray = dic[@"province"];
        }
    }else{
        [AJUtil toast:@"数据格式不正确"];
        return;
    }
    
    NSMutableString *cityStr = [[NSMutableString alloc] init];
    for (id city in self.cityArray){
        [cityStr appendString:[city objectForKey:@"name"]];
    }
    [AJUtil toast:cityStr];
}

@end
