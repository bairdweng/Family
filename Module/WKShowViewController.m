//
//  WKShowViewController.m
//  Family
//
//  Created by Baird-weng on 2017/10/24.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "WKShowViewController.h"
#import "WKModel.h"
#import "FYHeader.h"
@interface WKShowViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textContentLabel;

@end

@implementation WKShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textContentLabel.text = self.model.details;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
