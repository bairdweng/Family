//
//  FixButton.h
//  Family
//
//  Created by Baird-weng on 2017/9/3.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^EventBlock)(UIButton *button);
typedef NS_ENUM(NSInteger, FixButtonPosition) {
    FixButtonPositionBottomRight = 0, // slow at beginning and end
    FixButtonPositionBottomLeft = 1,
    FixButtonPositionBottomMiddle = 2

};
@interface FixButton : UIView
-(id)initWithImageName:(NSString *)imageName withPosition:(FixButtonPosition)position withEvents:(EventBlock)block;
-(void)updateTheLayout;
@end
