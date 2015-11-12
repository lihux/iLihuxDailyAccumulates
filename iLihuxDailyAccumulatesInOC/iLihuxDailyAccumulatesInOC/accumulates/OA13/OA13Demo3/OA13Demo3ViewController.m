//
//  OA13Demo3ViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihui on 15/11/11.
//  Copyright © 2015年 lihux. All rights reserved.
//

#import "OA13Demo3ViewController.h"

#import "OA13GlobalHelper.h"
#import "OA13StoryObject.h"

#import "AsyncDisplayKit.h"
#import "OA13Demo3CollectionViewCellNode.h"

@interface OA13Demo3ViewController () <ASCollectionViewDataSource, ASCollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, strong) ASCollectionView *collectionView;
@property (nonatomic, assign) CGSize cellSize;

@end

@implementation OA13Demo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [OA13GlobalHelper storyObjectsFromPlist];
    UICollectionViewLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[ASCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewLayout asyncDataFetching:YES];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.collectionView.asyncDataSource = self;
    self.collectionView.asyncDelegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.cellSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 2 - 1, [UIScreen mainScreen].bounds.size.width);

    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ASCollectionViewDataSource
- (ASCellNode *)collectionView:(ASCollectionView *)collectionView nodeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OA13Demo3CollectionViewCellNode *cellNode = [[OA13Demo3CollectionViewCellNode alloc] init];
    [cellNode configCellWithStoryObject:self.datas[indexPath.row]];
    return cellNode;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark - ASCollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView willBeginBatchFetchWithContext:(ASBatchContext *)context
{
    [context completeBatchFetching:YES];
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
