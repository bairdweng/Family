//
//  FYDateResult.m
//  Family
//
//  Created by Baird-weng on 2017/11/1.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYDateResult.h"
#import "FYHeader.h"
#import "SettingDataBase.h"
@implementation FYDateResult
+ (NSInteger)getResultByDate:(NSDate*)date{
    NSString *dateStr = [date formattedDateWithFormat:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
    date = [NSDate dateWithString:dateStr formatString:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
    NSInteger weekDay1 = [self getSubWeekDay:date.weekday];
    NSDate* date1 = [date dateBySubtractingDays:weekDay1];
    SettingDataBase* model = [SettingDataBase findByPK:1];
    if(!model){
        return -1;
    }
    NSDate* lastdate = [NSDate dateWithString:model.lastTime formatString:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
    NSInteger weekDay2 = [self getSubWeekDay:lastdate.weekday];
    NSDate* date2 = [lastdate dateBySubtractingDays:weekDay2];
    NSInteger weeks = [date1 weeksFrom:date2];
    if (weeks >= 0) {
        if (weeks % 2 == 0) {
            return model.restState;
        } else {
            if (model.restState == 1) {
                return 2;
            } else {
                return 1;
            }
        }
    } else {
        return -1;
    }
}
+ (NSString*)getResultStringByDate:(NSDate*)date{
    NSString *dateStr = [date formattedDateWithFormat:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
    date = [NSDate dateWithString:dateStr formatString:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
    NSInteger weekDay1 = [self getSubWeekDay:date.weekday];
    NSDate* date1 = [date dateBySubtractingDays:weekDay1];
    SettingDataBase* model = [SettingDataBase findByPK:1];
    if(!model){
        return @"";
    }
    NSDate* lastdate = [NSDate dateWithString:model.lastTime formatString:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
    NSInteger weekDay2 = [self getSubWeekDay:lastdate.weekday];
    NSDate* date2 = [lastdate dateBySubtractingDays:weekDay2];
    NSInteger weeks = [date1 weeksFrom:date2];
    if (weeks >= 0) {
        if (weeks % 2 == 0) {
            return model.restString;
        } else {
            if (model.restState == 1) {
                return @"双休";
            } else {
                return @"单休";
            }
        }
    } else {
        return @"";
    }
}
+(NSInteger)getSubWeekDay:(NSInteger)wday{
    if (wday <= 2) {
        return 0;
    } else {
        return wday-2;
    }
}
+ (void)Synchronize{
    NSUserDefaults* userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.family.app"];
    [userDefault setObject:[FYDateResult getResultStringByDate:[NSDate date]] forKey:@"stateStr"];
    [userDefault synchronize];
}
@end
