//
//  DDCollectionViewController.m
//  DDAutoTracker_Example
//
//  Created by 王海亮 on 2017/12/14.
//  Copyright © 2017年 yusipeng. All rights reserved.
//

#import "DDCollectionViewController.h"
#import "DDItemModel.h"
#import "DDCollectionViewCell.h"

static NSString *kDDCollectionViewCellIdentify = @"kDDCollectionViewCellIdentify";

@interface DDCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<DDItemModel *> *data;

@end

@implementation DDCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
}

- (void)setupSubviews {
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

#pragma mark - UICollectionViewDataSource
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DDCollectionViewCell *collectionViewCell = (DDCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kDDCollectionViewCellIdentify forIndexPath:indexPath];
    if (self.data.count > indexPath.row) {
        DDItemModel *model = [self.data objectAtIndex:indexPath.row];
        collectionViewCell.itemModel = model;
    }
    return collectionViewCell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - setters and getters

- (UICollectionView *)collectionView {
    if (nil == _collectionView) {
//        UICollectionViewFlowLayout *viewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
//        [viewFlowLayout setItemSize:CGSizeMake(100, 100)];
//        [viewFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:[UICollectionViewFlowLayout new]];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        [_collectionView registerClass:[DDCollectionViewCell class] forCellWithReuseIdentifier:kDDCollectionViewCellIdentify];
        
        [_collectionView setDelegate:self];
        [_collectionView setDataSource:self];
    }
    return _collectionView;
}

- (NSArray<DDItemModel *> *)data {
    if (nil == _data) {
        _data = @[[[DDItemModel alloc] initWithTitle:@"title a" intro:@"intro a"],
                  [[DDItemModel alloc] initWithTitle:@"title b" intro:@"intro b"],
                  [[DDItemModel alloc] initWithTitle:@"title c" intro:@"intro c"],
                  [[DDItemModel alloc] initWithTitle:@"title d" intro:@"intro d"],
                  [[DDItemModel alloc] initWithTitle:@"title e" intro:@"intro e"],];
    }
    return _data;
}

@end
