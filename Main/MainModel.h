//
//  MainModel.h
//  Family
//
//  Created by Baird-weng on 2017/8/31.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainItem.h"
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, FunctionModuleType) {
    FunctionModuleTypeWorking,
    FunctionModuleTypeSingleAndDouble
};
@interface MainModel : NSObject
+ (NSArray<MainItem*>*)initItems;
@property (nonatomic, assign) FunctionModuleType stype;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) id model;
@end
