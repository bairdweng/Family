//
//  FYNoticeManager.h
//  Family
//
//  Created by Baird-weng on 2017/10/27.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYNoticeManager : NSObject
+ (instancetype)sharedManager;
- (void)activation;
- (void)cancelAllLocalNotifications;
- (void)cleanLocalNoticationById:(NSString*)nid;
@end
