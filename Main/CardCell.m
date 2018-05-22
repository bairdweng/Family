//
//  MainTableViewCell.m
//  Family
//
//  Created by Baird-weng on 2017/8/31.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "CardCell.h"
#import "WKModel.h"
#import "FYHeader.h"
@interface CardCell ()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailsLabel;
@property(nonatomic,strong)UILabel *remindTimeLabel;
@end

@implementation CardCell


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
            make.left.top.equalTo(@10);
            make.right.equalTo(@(-15));
            make.height.equalTo(@20);
        }];
        self.detailsLabel.font = [UIFont systemFontOfSize:14];
        [self.detailsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.top.equalTo(self.titleLabel.mas_bottom).equalTo(@5);
            make.right.equalTo(@(-15));
            make.height.equalTo(@20);
        }];
        
        
        self.remindTimeLabel.font = [UIFont systemFontOfSize:14];
        [self.remindTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.detailsLabel.mas_bottom).equalTo(@5);
            make.right.equalTo(@(0));
            make.height.equalTo(@20);
            make.left.greaterThanOrEqualTo(@15);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(WKModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.detailsLabel.text = model.details;
    self.remindTimeLabel.text = model.getRemindTime;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
