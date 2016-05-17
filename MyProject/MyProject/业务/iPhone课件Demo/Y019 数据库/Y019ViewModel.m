//
//  Y019ViewModel.m
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y019ViewModel.h"

@implementation Y019ViewModel

-(void)loadData{

    self.viewTypeArray = @[VIEWTYPE(@"PlistWrite", @"plist数据写入"),
                           VIEWTYPE(@"PlistRead", @"plist数据读取"),
                           
                           VIEWTYPE(@"KeychainWrite", @"keychain数据写入"),
                           VIEWTYPE(@"KeychainRead", @"keychain数据读取"),
                           VIEWTYPE(@"KeychainDelete", @"keychain数据删除"),
                           
                           VIEWTYPE(@"UserDefaultRead", @"UserDefault数据读取"),
                           VIEWTYPE(@"UserDefaultWrite", @"UserDefault数据写入"),
                           
                           VIEWTYPE(@"Sqlite3DB", @"Sqlite3数据库创建"),
                           VIEWTYPE(@"Sqlite3Table", @"Sqlite3数据表创建"),
                           VIEWTYPE(@"Sqlite3Insert", @"Sqlite3数据写入"),
                           VIEWTYPE(@"Sqlite3Select", @"Sqlite3数据查询"),
                           VIEWTYPE(@"Sqlite3Update", @"Sqlite3数据修改"),
                           VIEWTYPE(@"Sqlite3Delete", @"Sqlite3数据删除"),
                           
                           VIEWTYPE(@"FMDBDB", @"FMDB数据库创建"),
                           VIEWTYPE(@"FMDBTable", @"FMDB数据表创建"),
                           VIEWTYPE(@"FMDBInsert", @"FMDB数据写入"),
                           VIEWTYPE(@"FMDBSelect", @"FMDB数据查询"),
                           VIEWTYPE(@"FMDBUpdate", @"FMDB数据修改"),
                           VIEWTYPE(@"FMDBDelete", @"FMDB数据删除"),
                           ];
    
    [self notifyToRefresh];
}

//plist
-(void)createPlistWrite{
    [AJUtil toast:@"A"];
}
-(void)createPlistRead{
    [AJUtil toast:@"B"];
}

//keychain
-(void)createKeychainWrite{
    [AJUtil toast:@"C"];
}
-(void)createKeychainRead{
    [AJUtil toast:@"D"];
}
-(void)createKeychainDelete{
    [AJUtil toast:@"E"];
}


//UserDefalut
-(void)createUserDefaultWrite{
    [AJUtil toast:@"F"];
}
-(void)createUserDefaultRead{
    [AJUtil toast:@"G"];
}


//sqlite3
-(void)createSqlite3DB{
    [AJUtil toast:@"H"];
}
-(void)createSqlite3Table{
    [AJUtil toast:@"I"];
}
-(void)createSqlite3Insert{
    [AJUtil toast:@"J"];
}
-(void)createSqlite3Select{
    [AJUtil toast:@"K"];
}
-(void)createSqlite3Update{
    [AJUtil toast:@"L"];
}
-(void)createSqlite3Delete{
    [AJUtil toast:@"M"];
}


//FMDB
-(void)createFMDBDB{
    [AJUtil toast:@"N"];
}
-(void)createFMDBTable{
    [AJUtil toast:@"O"];
}
-(void)createFMDBInsert{
    [AJUtil toast:@"Q"];
}
-(void)createFMDBSelect{
    [AJUtil toast:@"R"];
}
-(void)createFMDBUpdate{
    [AJUtil toast:@"S"];
}
-(void)createFMDBDelete{
    [AJUtil toast:@"T"];
}

@end
