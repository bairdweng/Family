//
//  WKModel.m
//  Family
//
//  Created by Baird-weng on 2017/9/5.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "WKModel.h"

@implementation WKModel
+ (NSArray<WKModel*>*)getTempleDatas
{
    WKModel *model1 = [[WKModel alloc]init];
    model1.title = @"今天完成要吃宵夜";
    model1.details = @"记得来个提醒，看我要吃什么，麻辣烫还是什么的？";
    model1.remindTime = @"19:02";
    model1.repeats = @[@"周一",@"周二",@"周三"];
    
    
    WKModel *model2 = [[WKModel alloc]init];
    model2.title = @"今天完成要吃宵夜";
    model2.details = @"记得来个提醒，看我要吃什么，麻辣烫还是什么的？";
    model2.remindTime = @"17:02";
    model2.repeats = @[@"周一",@"周二",@"周三"];
    
    return @[model1,model2];
}
@end
