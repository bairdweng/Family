//
//  SettingDataBase.h
//  Family
//
//  Created by Baird-weng on 2017/10/31.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKDBModel.h"

@interface SettingDataBase : JKDBModel
@property (nonatomic, assign) NSInteger restState;
@property (nonatomic, strong) NSString* restString;
@property (nonatomic, strong) NSString* lastTime;

@end

