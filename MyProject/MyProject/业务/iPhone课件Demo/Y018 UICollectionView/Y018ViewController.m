//
//  Y018ViewController.m
//  MyProject
//
//  Created by caoyang on 16/5/12.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y018ViewController.h"
#import "Y018ViewModel.h"
#import "Y018CollectionViewCell.h"

@interface Y018ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) Y018ViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *hArr;
@end

@implementation Y018ViewController

//加载主要显示内容(tableView,navigationcontroller)
-(void)loadView{
    [super loadView];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical]; //设置横向还是竖向
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenWidth ,screenHeight) collectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView registerClass:[Y018CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    
    WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.collectionView stopRefresh];
    [self.collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.viewModel collCount];
}

//每个UICollectionView展示的内容
-(Y018CollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Y018CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell cellHeightAtHArr:self.viewModel.hArr row:[indexPath row]];
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return  CGSizeMake(screenWidth/colletionCell-8, [self.viewModel itemHeight:[indexPath row]]);  //设置cell宽高
}

#pragma mark --UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Y018CollectionViewCell * cell = (Y018CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
}

@end
