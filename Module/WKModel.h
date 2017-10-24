//
//  WKModel.h
//  Family
//
//  Created by Baird-weng on 2017/9/5.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JKDBModel.h"
@interface WKModel : JKDBModel
+ (NSArray<WKModel*>*)getTempleDatas;
@property (nonatomic, assign) NSInteger recordId;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *details;
@property (nonatomic, strong) NSString* remindTime;
@property (nonatomic, strong) NSArray* repeats;
@property (nonatomic, assign) CGFloat cellHeight;
@end
