//
//  FYSettingCell.h
//  Family
//
//  Created by Baird-weng on 2017/10/30.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface FYSettingModel : NSObject
@property (nonatomic, strong) NSString* title;
//@property (nonatomic, assign) NSInteger index;
@end

@interface FYSettingCell : UITableViewCell
@property(nonatomic,strong)FYSettingModel *model;
@end
