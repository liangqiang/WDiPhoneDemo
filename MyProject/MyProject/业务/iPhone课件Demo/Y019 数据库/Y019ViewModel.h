//
//  Y019ViewModel.h
//  MyProject
//
//  Created by caoyang on 16/5/17.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "YScrollViewModel.h"
#import <sqlite3.h>

@interface Y019ViewModel : YScrollViewModel

@property (nonatomic, assign) sqlite3 *db;

//plist
-(void)createPlistWrite;
-(void)createPlistRead;

//keychain
-(void)createKeychainWrite;
-(void)createKeychainRead;
-(void)createKeychainDelete;


//UserDefalut
-(void)createUserDefaultWrite;
-(void)createUserDefaultRead;


//sqlite3
-(void)createSqlite3DB;
-(void)createSqlite3Table;
-(void)createSqlite3Insert;
-(void)createSqlite3Select;
-(void)createSqlite3Update;
-(void)createSqlite3Delete;


//FMDB
-(void)createFMDBDB;
-(void)createFMDBTable;
-(void)createFMDBInsert;
-(void)createFMDBSelect;
-(void)createFMDBUpdate;
-(void)createFMDBDelete;

@end
