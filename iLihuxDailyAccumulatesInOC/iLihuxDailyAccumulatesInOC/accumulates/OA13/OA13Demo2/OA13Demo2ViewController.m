//
//  OA13Demo2ViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA13Demo2ViewController.h"

#import "OA13Demo2CollectionViewCell.h"
#import "OA13GlobalHelper.h"

@interface OA13Demo2ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, assign) CGSize cellSize;

@end

@implementation OA13Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [OA13GlobalHelper storyObjectsFromPlist];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.cellSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 2 - 1, [UIScreen mainScreen].bounds.size.width);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OA13Demo2CollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"OA13Demo2CollectionViewCell" forIndexPath:indexPath];
    cell.bounds = CGRectMake(0, 0, self.cellSize.width, self.cellSize.height);
    [cell configCellWithStoryObject:self.datas[indexPath.row]];
    return cell;
}

#pragma - UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

@end
