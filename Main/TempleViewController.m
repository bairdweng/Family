//
//  ViewController.m
//  Family
//
//  Created by Baird-weng on 2017/8/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//
#import "TempleViewController.h"
#import "MainTableViewCell.h"
#import "MainCollectionViewCell.h"
#import "masonry.h"
#import "MainCollectionViewFlowLayout.h"
#import "MainModel.h"
@interface TempleViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
MainCollectionViewFlowLayoutDelegate>{
    NSArray* _dataSource;
}
@end
@implementation TempleViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    MainCollectionViewFlowLayout* layout = [[MainCollectionViewFlowLayout alloc] init];
    layout.layoutDelegate = self;
    UICollectionView* collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collection];
    collection.delegate = self;
    collection.dataSource = self;
    [collection registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"conllectId"];
    [collection mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view);
    }];
    _dataSource = [MainModel initItems];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataSource.count;
}
- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    MainItem *item = _dataSource[section];
    return item.images.count;
}
- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    MainItem *item = _dataSource[indexPath.section];
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"conllectId" forIndexPath:indexPath];
    cell.imageURL = item.images[indexPath.row];
    return cell;
}
- (CGSize)collectionView:(UICollectionView*)collectionView collectionViewLayout:(MainCollectionViewFlowLayout*)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath*)indexPath{
    return CGSizeMake(0, 150);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
