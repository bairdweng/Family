//
//  FYLocalNotification.h
//  Family
//
//  Created by Baird-weng on 2017/10/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYLocalNotification : NSObject
+ (instancetype)sharedManager;
- (void)showMessageTitle:(NSString*)title WithBody:(NSString*)body withDate:(NSDate *)date;
@end
