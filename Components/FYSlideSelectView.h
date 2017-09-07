 
        
    //
//  FYSlideSelectView.h
//  Family
//
//  Created by Baird-weng on 2017/9/7.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYSlideSelectModel : NSObject
@property(nonatomic,strong)NSString *itemName;
@property(nonatomic,assign)NSInteger itemValue;
@property (nonatomic, assign) BOOL isSlect;
@end

@interface FYSlideSelectView : UIView
@property (nonatomic, strong) NSArray<FYSlideSelectModel *>* selectItems;
@property (nonatomic, weak) UIColor* unselectColor;
@property (nonatomic, weak) UIColor* selectColor;
@end
