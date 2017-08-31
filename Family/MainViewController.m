//
//  ViewController.m
//  Family
//
//  Created by Baird-weng on 2017/8/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//
#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "MainCollectionViewCell.h"
#import "masonry.h"
@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@end
@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView* collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collection];
    collection.delegate = self;
    collection.dataSource = self;
    [collection registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"conllectId"];
    [collection mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}
- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"conllectId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
