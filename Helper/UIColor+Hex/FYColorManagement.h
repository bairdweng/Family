//
//  FYColorManagement.h
//  Family
//
//  Created by Baird-weng on 2017/11/1.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FYColorManagement : NSObject
+(instancetype)sharedManager;
@property (nonatomic, strong) UIColor* themColor;
- (void)setThemeColorStr:(NSString*)colorStr;
@end
