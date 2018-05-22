//
//  FYCheakCell.m
//  Family
//
//  Created by Baird-weng on 2017/9/15.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYCheckCell.h"
#import <BEMCheckBox/BEMCheckBox.h>
#import "FYHeader.h"


@interface FYCheckCell()

@property (nullable, strong) BEMCheckBox* checkBox;

@end



@implementation FYCheckBoxModel
@end
@implementation FYCheckCell

- (void)awakeFromNib {
    [super awakeFromNib];
    BEMCheckBox *checkBox = [BEMCheckBox new];
    [self.contentView addSubview:checkBox];
    [checkBox setLineWidth:1.5];
    [checkBox setAnimationDuration:0.5];
    [checkBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).equalTo(@(-10));
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@30);
    }];
    checkBox.enabled = NO;
    self.checkBox = checkBox;
    // Initialization code
}
-(void)setModel:(FYCheckBoxModel *)model{
    _model = model;
    self.titleLabel.text = model.checkBoxText;
    [self.checkBox setOn:model.isSelect animated:YES];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
