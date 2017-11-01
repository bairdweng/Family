//
//  FixButton.m
//  Family
//
//  Created by Baird-weng on 2017/9/3.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FixButton.h"
#import "FYHeader.h"
#define BUTTON_WIDTH @50
@implementation FixButton{
    NSString *_imageName;
    FixButtonPosition _position;
    UIButton *_button;
    EventBlock _myblock;
}
-(id)initWithImageName:(NSString *)imageName withPosition:(FixButtonPosition)position withEvents:(EventBlock)block{
    self = [super initWithFrame:CGRectZero];
    _position = position;
    _myblock = block;
    if(self){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [FYColorManagement sharedManager].themColor;
        [self addSubview:button];
        if(imageName&&imageName.length>0){
            [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        }
        else{
            button.backgroundColor = [UIColor redColor];
        }
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [button addTarget:self action:@selector(clickOntheButton:) forControlEvents:UIControlEventTouchUpInside];
        _button = button;
    }
    return self;
}
-(void)clickOntheButton:(UIButton *)sender{
    dispatch_async(dispatch_get_main_queue(), ^{
        _myblock(sender);
    });
}
-(void)updateTheLayout{
    if(self.superview){
        if(_position == FixButtonPositionBottomRight){
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.height.equalTo(BUTTON_WIDTH);
                make.right.equalTo(@(-15));
                make.bottom.equalTo(@(-15));
            }];
        } else if (_position == FixButtonPositionBottomRight) {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.height.equalTo(BUTTON_WIDTH);
                make.left.equalTo(@15);
                make.bottom.equalTo(@(-15));
            }];
        }
        else{
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.height.equalTo(BUTTON_WIDTH);
                make.centerX.equalTo(self.superview);
                make.bottom.equalTo(@(-15));
            }];
        }
        _button.layer.cornerRadius = [BUTTON_WIDTH integerValue]/2;
        _button.layer.masksToBounds = YES;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
