//
//  FYColorManagement.m
//  Family
//
//  Created by Baird-weng on 2017/11/1.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYColorManagement.h"
#import "FYHeader.h"
@implementation FYColorManagement
+(instancetype)sharedManager{
    static FYColorManagement* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
- (void)setThemeColorStr:(NSString*)colorStr{
    [[NSUserDefaults standardUserDefaults]setObject:colorStr forKey:FYRHENCOLORSTRING];
    [FYColorManagement sharedManager].themColor = [UIColor colorWithHexString:colorStr];
}
@end
