//
//  FYNoticeManager.m
//  Family
//
//  Created by Baird-weng on 2017/10/27.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYNoticeManager.h"
#import "FYLocalNotification.h"
#import "WKModel.h"
#import "DateTools.h"
#import "FYCheckCell.h"
#import "FYHeader.h"
#import "NSStringConversion.h"
#import <AVFoundation/AVFoundation.h>
@interface FYNoticeManager()
@end

@implementation FYNoticeManager
+(instancetype)sharedManager{
    static FYNoticeManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
//激活
- (void)activation{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray* models = [WKModel findAll];
        NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
        for (WKModel* model in models) {
            [self cleanLocalNoticationById:model.udid];
            NSArray* ratt = [model.repeats mj_JSONObject];
            NSArray* modelAtt = [FYCheckBoxModel mj_objectArrayWithKeyValuesArray:ratt];
            for (int i = 0; i<30; i++) {
                NSDate* addDate = [[NSDate date] dateByAddingDays:i];
                NSString* dateStr = [addDate formattedDateWithFormat:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
                for (FYCheckBoxModel* cmodel in modelAtt) {
                    if (cmodel.isSelect) {
                        if (addDate.weekday == cmodel.weekIndex) {
                            NSString* jutiDate = [NSString stringWithFormat:@"%@ %@", dateStr, [model getRemindTime]];
                            NSDate* date = [NSStringConversion conversionDateWithString:jutiDate WithFormart:@"yyyy-MM-dd HH:mm"];
                            [self setLocalNotification:date withTitle:model.title withBody:model.details withuid:model.udid];
                        }
                    }
                }
            }
        }
    });
}
- (void)setLocalNotification:(NSDate*)date withTitle:(NSString*)title withBody:(NSString*)body withuid:(NSString*)uid
{
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    localNote.repeatInterval = NSCalendarUnitDay;
    // 2.设置本地通知的内容
    // 2.1.设置通知发出的时间
    localNote.fireDate = date;
    localNote.timeZone = [NSTimeZone systemTimeZone];
    localNote.soundName = UILocalNotificationDefaultSoundName;
    localNote.userInfo = @{ FYLOCALNOTIFICATIONID : uid };
    // 2.2.设置通知的内容
    localNote.alertBody = body;
    // 2.3.设置滑块的文字（锁屏状态下：滑动来“解锁”）
    localNote.alertAction = @"解锁";
    // 2.4.决定alertAction是否生效
    localNote.hasAction = NO;
    
    localNote.alertTitle = title;
    
    localNote.applicationIconBadgeNumber = 0;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
}
- (void)cleanLocalNoticationById:(NSString*)nid{
    NSArray* localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    if (localNotifications) {
        for (UILocalNotification *notification in localNotifications) {
            NSDictionary *userInfo = notification.userInfo;
            if (userInfo){
                //根据设置通知参数时指定的key来获取通知参数
                NSString *info = userInfo[FYLOCALNOTIFICATIONID];
                // 如果找到需要取消的通知，则取消
                if ([info isEqualToString:nid]) {
                    if (notification) {
                        [[UIApplication sharedApplication] cancelLocalNotification:notification];
                    }
                    break;
                }
            }
        }
  }
}
-(void)cancelAllLocalNotifications{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
@end
