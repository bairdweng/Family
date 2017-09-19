//
//  FYSlideSelectView.m
//  Family
//
//  Created by Baird-weng on 2017/9/7.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYSlideSelectView.h"

@implementation FYSlideSelectModel
@end


@interface FYSlideSelectView(){
    UIView* _contenView;
}
@end
@implementation FYSlideSelectView
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
    }
    return self;
}
- (void)setSelectItems:(NSArray<FYSlideSelectModel*>*)selectItems
{
    _selectItems = selectItems;
    if(!_contenView){
        _contenView = UIView.new;
        [self addSubview:_contenView];
    }
    if(_contenView.subviews.count>0){
        for(UIView *subView in _contenView.subviews){
            [subView removeFromSuperview];
        }
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
