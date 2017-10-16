//
//  FYDatePickerManage.h
//  Family
//
//  Created by Baird-weng on 2017/10/16.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FYDatePickerManage : UIViewController
typedef void (^resultdate)(NSDate *currentdate);
@property(nonatomic,assign)UIDatePickerMode *datePickerMode;

-(void)KwdatePickCurrentTarget:(id)Target withDate:(NSDate *)date withresultDate:(resultdate)result;
@end
