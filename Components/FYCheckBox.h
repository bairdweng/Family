//
//  FYCheckBox.h
//  Family
//
//  Created by Baird-weng on 2017/9/15.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYCheckCell.h"
@interface FYCheckBox : UIViewController
@property (nonatomic, copy) NSArray<FYCheckBoxModel*>* dataSource;
@end
