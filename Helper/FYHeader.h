//
//  FYHeader.h
//  Family
//
//  Created by Baird-weng on 2017/9/3.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#ifndef FYHeader_h
#define FYHeader_h
#endif /* FYHeader_h */
#import "masonry.h"
#import "FYProgessHUD.h"
#import "UIColor+Hex.h"
#import "JKDBHelper.h"
#import "MJExtension.h"
#import "FSTextView.h"
#import "BaseViewController.h"
#import "JKDBModel.h"
#import "FYJson.h"
#import "NSStringConversion.h"
#import "DateTools.h"
#import "FYColorManagement.h"
#define FYLOCALNOTIFICATIONID @"FYLOCALNOTIFICATIONID"
#define FYRHENCOLORSTRING @"FYRHENCOLORSTRING"
#define NAVIGARIONBLACKCOLOR [UIColor colorWithHexString:@"2196F3"]
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define SandBoxpath(Name)[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",Name]]
