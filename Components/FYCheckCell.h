//
//  FYCheakCell.h
//  Family
//
//  Created by Baird-weng on 2017/9/15.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BEMCheckBox/BEMCheckBox.h>
@interface FYCheckBoxModel : NSObject
@property(nonatomic,copy)NSString *checkBoxText;
@property(nonatomic,assign)BOOL isSelect;
@end

@interface FYCheckCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic,strong)FYCheckBoxModel *model;
@end
