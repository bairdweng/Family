//
//  FYDateResult.h
//  Family
//
//  Created by Baird-weng on 2017/11/1.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYDateResult : NSObject
+ (NSInteger)getResultByDate:(NSDate*)date;
+ (NSString*)getResultStringByDate:(NSDate*)date;
+ (void)Synchronize;
@end
