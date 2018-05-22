//
//  MainCollectionViewCell.m
//  Family
//
//  Created by Baird-weng on 2017/8/31.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//
#import "MainCollectionViewCell.h"
#import "MainItem.h"
#import <Masonry.h>
@interface MainCollectionViewCell()
@property(nonatomic,weak)UIImageView *imageView;
@end
@implementation MainCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor redColor];
        UIImageView *myImageView = [UIImageView new];
        myImageView.contentMode = UIViewContentModeScaleAspectFill;
        myImageView.clipsToBounds = YES;
        [self.contentView addSubview:myImageView];
        [myImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        _imageView = myImageView;
    }
    return self;
}
-(void)setImageURL:(NSString *)imageURL{
    _imageURL = imageURL;
    [_imageView setImage:[UIImage imageNamed:@"test"]];
    
}
@end
