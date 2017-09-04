//
//  UIColor+Hex.h
//  Family
//
//  Created by Baird-weng on 2017/9/4.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;
@end
