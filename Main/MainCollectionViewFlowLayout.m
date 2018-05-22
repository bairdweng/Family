//
//  MainCollectionViewFlowLayout.m
//  Family
//
//  Created by Baird-weng on 2017/9/1.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "MainCollectionViewFlowLayout.h"
@interface MainCollectionViewFlowLayout ()
@property(nonatomic,strong)NSMutableArray * attrsArr;
@property (nonatomic, assign) CGFloat contentSizeHeight;//内容高度。
@property (assign, nonatomic) NSInteger cellCount; // cell个数。
@property (assign, nonatomic) CGFloat itemWidth; // cell宽度。
@property (assign, nonatomic) CGFloat insert; // 间距。
@end
@implementation MainCollectionViewFlowLayout
-(NSMutableArray *)attrsArr{
    if(!_attrsArr){
        _attrsArr=[[NSMutableArray alloc] init];
    }
    return _attrsArr;
}
-(void)prepareLayout{
    [super prepareLayout];
    self.insert = 2;
    self.contentSizeHeight = self.insert;
    [self.attrsArr removeAllObjects];
    [self creatAttrs];
}
-(void)creatAttrs{
    //计算组
    NSInteger Section = [self.collectionView numberOfSections];
    for (int j = 0; j < Section; j++) {
        //计算出每组有多少个
        NSInteger  count=[self.collectionView numberOfItemsInSection:j];
        for (int i=0; i<count; i++) {
            //创建UICollectionViewLayoutAttributes
            NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:j];
            UICollectionViewLayoutAttributes * attrs=[self layoutAttributesForItemAtIndexPath:indexPath];
            [self.attrsArr addObject:attrs];
        }
    }
}
- (CGSize)collectionViewContentSize {
    return CGSizeMake(0, self.contentSizeHeight);
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArr;
}
#pragma mark ---- 这个方法需要返回indexPath位置对应cell的布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize itemSize = [self.layoutDelegate collectionView:self.collectionView collectionViewLayout:self sizeOfItemAtIndexPath:indexPath];
    NSInteger count=[self.collectionView numberOfItemsInSection:indexPath.section];
    UICollectionViewLayoutAttributes* attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (count == 1) {
        CGFloat itemWidth = (self.collectionView.frame.size.width - self.insert * 2);
        CGFloat  itemSize_height = itemSize.height>0?itemSize.height:itemWidth;
        attrs.frame = CGRectMake(self.insert, self.contentSizeHeight, itemWidth, itemSize_height);
        self.contentSizeHeight +=itemSize_height+self.insert;
    }
    else if (count == 2){
        CGFloat itemWidth = (self.collectionView.frame.size.width-self.insert*3)/2;
        CGFloat  itemSize_height = itemSize.height>0?itemSize.height:itemWidth;
        attrs.frame = CGRectMake((self.insert+itemWidth)*indexPath.row+self.insert, self.contentSizeHeight, itemWidth, itemSize_height);
        if(indexPath.row == 1){
            self.contentSizeHeight +=itemSize_height+self.insert;
        }
    }
    else if (count == 3){
        CGFloat itemWidth = (self.collectionView.frame.size.width-self.insert*4)/3;
        CGFloat  itemSize_height = itemSize.height>0?itemSize.height:itemWidth;
        attrs.frame = CGRectMake((self.insert+itemWidth)*indexPath.row+self.insert, self.contentSizeHeight, itemWidth, itemSize_height);
        if(indexPath.row == 2){
            self.contentSizeHeight +=itemSize_height+self.insert;
        }
    }
    else{
        CGFloat itemWidth = (self.collectionView.frame.size.width - self.insert * 4) / 3;
        NSInteger locIndex = indexPath.row;
        CGFloat  itemSize_height = itemSize.height>0?itemSize.height:itemWidth;
        if(indexPath.row >2){
            locIndex = indexPath.row%3;
        }
        attrs.frame = CGRectMake((self.insert + itemWidth) * locIndex + self.insert, self.contentSizeHeight, itemWidth, itemSize_height);
        //换行
        if(((indexPath.row+1)%3==0&&indexPath.row>0)||(indexPath.row==count-1)){
            self.contentSizeHeight +=itemSize_height+self.insert;
        }
    }
    return attrs;
}
@end
