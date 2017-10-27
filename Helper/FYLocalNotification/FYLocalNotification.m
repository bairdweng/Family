//
//  FYLocalNotification.m
//  Family
//
//  Created by Baird-weng on 2017/10/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYLocalNotification.h"
#import <UIKit/UIKit.h>
@implementation FYLocalNotification
+(instancetype)sharedManager{
    static FYLocalNotification* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
- (void)showMessageTitle:(NSString*)title WithBody:(NSString*)body withDate:(NSDate *)date{
    // 1.创建本地通知
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    localNote.repeatInterval = NSCalendarUnitDay;
    // 2.设置本地通知的内容
    // 2.1.设置通知发出的时间
    localNote.fireDate = date;
    // 2.2.设置通知的内容
    localNote.alertBody = body;
    // 2.3.设置滑块的文字（锁屏状态下：滑动来“解锁”）
    localNote.alertAction = @"解锁";
    // 2.4.决定alertAction是否生效
    localNote.hasAction = NO;
 
    localNote.alertTitle = title;

    localNote.applicationIconBadgeNumber = 1;

    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
}
@end
