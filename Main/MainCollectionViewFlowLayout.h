//
//  MainCollectionViewFlowLayout.h
//  Family
//
//  Created by Baird-weng on 2017/9/1.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainCollectionViewFlowLayout;
@protocol MainCollectionViewFlowLayoutDelegate <NSObject>

@required
- (CGSize)collectionView:(UICollectionView*)collectionView collectionViewLayout:(MainCollectionViewFlowLayout*)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath*)indexPath;
@end
@interface MainCollectionViewFlowLayout : UICollectionViewLayout
@property (assign, nonatomic) id<MainCollectionViewFlowLayoutDelegate> layoutDelegate;

@end
