//
//  FYSettingCell.m
//  Family
//
//  Created by Baird-weng on 2017/10/30.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYSettingCell.h"
#import "FYHeader.h"
@implementation FYSettingModel
@end


@interface FYSettingCell()
@property (nonatomic, weak) UILabel* mytextLabel;
@property (nonatomic, weak) UILabel* mycontentLabel;

@end
@implementation FYSettingCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self initData];
    }
    return self;
}
-(void)initData{
    UILabel* mytextLabel = [UILabel new];
    [self.contentView addSubview:mytextLabel];
    [mytextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.height.centerY.equalTo(self.contentView);
    }];
    self.mytextLabel = mytextLabel;
    UILabel* mycontentLabel = [UILabel new];
    [self.contentView addSubview:mycontentLabel];
    [mycontentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-10));
        make.height.centerY.equalTo(self.contentView);
    }];
    self.mycontentLabel = mycontentLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(FYSettingModel *)model{
    _model = model;
    self.mytextLabel.text = model.title;
    self.mycontentLabel.text = model.content;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
