//
//  NSStringConversion.m
//  Family
//
//  Created by Baird-weng on 2017/10/27.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "NSStringConversion.h"

@implementation NSStringConversion
+ (NSDate*)conversionDateWithString:(NSString*)string WithFormart:(NSString*)formart{
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:formart];
     [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
     NSDate* date = [dateFormatter dateFromString:string];
     return date;
}
@end
