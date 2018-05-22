//
//  FYCheckBox.h
//  Family
//
//  Created by Baird-weng on 2017/9/15.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYCheckCell.h"
typedef void (^FYCheckBoxBlock)(NSArray<FYCheckBoxModel*> *datas);

@interface FYCheckBox : UIViewController
- (void)initDataSources:(NSArray<FYCheckBoxModel*>*)dataSources withBlock:(FYCheckBoxBlock)resultBlock;
@end
