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
-(void)createPlistWrite {
    //获取沙盒路径下的可读可写文件夹
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"test.plist"];
    NSLog(@"=====%@",path);
    //写入的数据(把数组写入到plist)
    NSArray *writeArray = @[@"one",@"two",@"three",@"four"];
    
    BOOL result =  [writeArray writeToFile:filename atomically:YES];
    
    if (result) {
        [AJUtil toast:@"写入成功"];
    }else {
        [AJUtil toast:@"写入失败"];
    }
}
-(void)createPlistRead {
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"test.plist"];

    NSArray *listArray = [NSArray arrayWithContentsOfFile:filename];
    NSMutableString *listStr = [[NSMutableString alloc] initWithCapacity:10];
    for (NSString* str in listArray) {
        [listStr appendFormat:@"%@  ",str];
    }
    [AJUtil toast:listStr];
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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"user" forKey:@"userName"];
    [defaults setObject:@"pass" forKey:@"passWord"];
    [AJUtil toast:@"写入成功"];
}
-(void)createUserDefaultRead{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [defaults objectForKey:@"userName"];
    NSString *passWord = [defaults objectForKey:@"passWord"];
    NSString *str = [NSString stringWithFormat:@"用户名：%@  密码：%@",userName,passWord];
    [AJUtil toast:str];
}


//sqlite3
-(void)createSqlite3DB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *filePath = [documentsDir stringByAppendingPathComponent:@"Young.sqlite"];
    
    if (sqlite3_open([filePath UTF8String], &(_db)) != SQLITE_OK) {
        sqlite3_close(_db);
        [AJUtil toast:@"数据库打开失败"];
    }else {
        [AJUtil toast:@"数据库打开成功"];
    }
}
-(void)createSqlite3Table{
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";
    [self execSql:sqlCreateTable];
}
-(void)createSqlite3Insert{
    NSString *insertSql = @"insert into PERSONINFO (name, age , address) values('Young', 20, '北京昌平');";
    [self execSql:insertSql];
}
-(void)createSqlite3Select{
    NSMutableString *mStr = [NSMutableString stringWithCapacity:10];
    NSString *selSql = @"SELECT * FROM PERSONINFO";
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(_db, [selSql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            
            char *name = (char *)sqlite3_column_text(stmt, 1);
            NSString *nameString = [[NSString alloc] initWithUTF8String:name];
            [mStr appendString:nameString];
            
            int age = sqlite3_column_int(stmt, 2);
            [mStr appendFormat:@" %d",age];
            
            char *address = (char *)sqlite3_column_text(stmt, 3);
            NSString *addressString = [[NSString alloc] initWithUTF8String:address];
            [mStr appendFormat:@" %@",addressString];
        }  
        
        sqlite3_finalize(stmt);  
    }
    [AJUtil toast:mStr];
    //用完了一定记得关闭，释放内存  
    sqlite3_close(_db);
}
-(void)createSqlite3Update{
    NSString *updateSql = @"UPDATE PERSONINFO SET age = '50' WHERE name = 'Young'";
    [self execSql:updateSql];
}
-(void)createSqlite3Delete{
    NSString *deleteSql = @"DELETE FROM PERSONINFO WHERE name = 'Young'";
    [self execSql:deleteSql];
}
-(void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(_db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(_db);
        NSString *errorMessage = [NSString stringWithFormat:@"error:%s",err];
        [AJUtil toast:errorMessage];
    } else{
        [AJUtil toast:@"成功"];
    }
}


-(FMDatabase*)createFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *filePath = [documentsDir stringByAppendingPathComponent:@"Young.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:filePath];
    return db;
}
//FMDB
-(void)createFMDBDB{
    FMDatabase *db = [self createFile];
    
    if (![db open]) {
        [AJUtil toast:@"数据库打开失败"];
    } else {
        [AJUtil toast:@"数据库打开成功"];
    }
}
-(void)createFMDBTable{
    
    FMDatabase *db = [self createFile];
    if ([db open]){
        NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (!res) {
            [AJUtil toast:@"error when creating db table"];
        } else {
            [AJUtil toast:@"success to creating db table"];
        }
        [db close];
    }
}
-(void)createFMDBInsert{
    FMDatabase *db = [self createFile];
    if ([db open]){
        NSString *insertSql = @"insert into PERSONINFO (name, age , address) values('Young', 20, '北京昌平');";
        BOOL res = [db executeUpdate:insertSql];
        if (!res) {
            [AJUtil toast:@"error when insert db table"];
        } else {
            [AJUtil toast:@"success to insert db table"];
        }
        [db close];
    }
}
-(void)createFMDBSelect{
    NSMutableString *mStr = [NSMutableString stringWithCapacity:10];
    FMDatabase *db = [self createFile];
    if ([db open]) {
        NSString *selSql = @"SELECT * FROM PERSONINFO";
        FMResultSet * rs = [db executeQuery:selSql];
        while ([rs next]) {
            int Id = [rs intForColumn:@"ID"];
            NSString * name = [rs stringForColumn:@"name"];
            NSString * age = [rs stringForColumn:@"age"];
            NSString * address = [rs stringForColumn:@"address"];
            [mStr appendFormat:@"id:%d",Id];
            [mStr appendFormat:@" name:%@",name];
            [mStr appendFormat:@" age:%@",age];
            [mStr appendFormat:@" address:%@",address];
        }
        [db close];
    }
    [AJUtil toast:mStr];
}
-(void)createFMDBUpdate{
    FMDatabase *db = [self createFile];
    if ([db open]){
        NSString *updateSql = @"UPDATE PERSONINFO SET age = '50' WHERE name = 'Young'";
        BOOL res = [db executeUpdate:updateSql];
        if (!res) {
            [AJUtil toast:@"error when update db table"];
        } else {
            [AJUtil toast:@"success to update db table"];
        }
        [db close];
    }
}
-(void)createFMDBDelete{
    FMDatabase *db = [self createFile];
    if ([db open]){
        NSString *deleteSql = @"DELETE FROM PERSONINFO WHERE name = 'Young'";
        BOOL res = [db executeUpdate:deleteSql];
        if (!res) {
            [AJUtil toast:@"error when delete db table"];
        } else {
            [AJUtil toast:@"success to delete db table"];
        }
        [db close];
    }
}

@end
