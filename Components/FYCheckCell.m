//
//  FYCheakCell.m
//  Family
//
//  Created by Baird-weng on 2017/9/15.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYCheckCell.h"
@implementation FYCheckBoxModel
@end
@implementation FYCheckCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(FYCheckBoxModel *)model{
    _model = model;
    self.titleLabel.text = model.checkBoxText;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
