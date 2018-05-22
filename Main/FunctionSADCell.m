//
//  FunctionSADCell.m
//  Family
//
//  Created by Baird-weng on 2017/10/31.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FunctionSADCell.h"
#import "FYHeader.h"
#import "SADModel.h"
@interface FunctionSADCell ()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailsLabel;
@property(nonatomic,strong)UILabel *remindTimeLabel;
@end
@implementation FunctionSADCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.titleLabel = [UILabel new];
        [self.contentView addSubview:self.titleLabel];
        self.detailsLabel = [UILabel new];
        [self.contentView addSubview:self.detailsLabel];
        self.remindTimeLabel = [UILabel new];
        [self.contentView addSubview:self.remindTimeLabel];
        
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.centerY.equalTo(self.contentView);
        }];
        self.detailsLabel.font = [UIFont systemFontOfSize:14];
        [self.detailsLabel mas_makeConstraints:^(MASConstraintMaker* make) {
            make.right.equalTo(@(-10));
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}
-(void)setModel:(SADModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.detailsLabel.text = model.details;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
