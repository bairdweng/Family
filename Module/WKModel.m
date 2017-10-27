//
//  WKModel.m
//  Family
//
//  Created by Baird-weng on 2017/9/5.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "WKModel.h"
#import "DateTools.h"
@implementation WKModel

- (NSString *)getRemindTime{
    NSDate *date = [NSStringConversion conversionDateWithString:self.reminddate WithFormart:@"yyyy-MM-dd HH:mm:ss"];
    return [date formattedDateWithFormat:@"HH:mm" timeZone:[NSTimeZone systemTimeZone]];
}
@end
