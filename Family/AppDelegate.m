//
//  AppDelegate.m
//  Family
//
//  Created by Baird-weng on 2017/8/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager/IQKeyboardManager.h"
#import "FYHeader.h"
#import "FYNoticeManager.h"
@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) { // iOS8
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:setting];
    }
    [[FYNoticeManager sharedManager] cancelAllLocalNotifications];
    [[FYNoticeManager sharedManager]activation];
    
    
//    NSString* themColorstr = [[NSUserDefaults standardUserDefaults] objectForKey:FYRHENCOLORSTRING];
//    if(themColorstr&&themColorstr.length>0){
//        [FYColorManagement sharedManager].themColor = [UIColor colorWithHexString:themColorstr];
//    } else {
//         [FYColorManagement sharedManager].themColor = [UIColor colorWithNavigation];
//    }
    [FYColorManagement sharedManager].themColor = [UIColor redColor];

    NSLog(@"%@",SandBoxpath(@""));
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@"收到本地通知");
    NSLog(@"---%@---",notification.alertBody);
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
