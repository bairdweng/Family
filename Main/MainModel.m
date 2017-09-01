//
//  MainModel.m
//  Family
//
//  Created by Baird-weng on 2017/8/31.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "MainModel.h"
@implementation MainModel
+ (NSArray<MainItem*>*)initItems{
    NSMutableArray *items = [[NSMutableArray alloc]init];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"png"];
    for (int i = 0; i<200; i++) {
        MainItem *item = [[MainItem alloc]init];
        item.title = [NSString stringWithFormat:@"我是标题%d",i+1];
        item.describe = [NSString stringWithFormat:@"我是描述%d", i + 1];
        if(i%2==0){
            item.images = @[ path, path, path ];
        }
        else{
            item.images = @[ path, path ];
        }
        [items addObject:item];
    }
    return items;
}
@end
