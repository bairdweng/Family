//
//  WorkingViewController.m
//  Family
//
//  Created by Baird-weng on 2017/9/4.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "WKViewController.h"
#import "FYSlideSelectView.h"
@interface WKViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet FYSlideSelectView *slideSelectView;
@property (weak, nonatomic) IBOutlet UIButton *selectDateButton;
@end

@implementation WKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(clickCancel)];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(clickSave)];
     self.slideSelectView.selectItems = @[
         [self getSelectModelWithItemName:@"周一"
                            withItemValue:1],
         [self getSelectModelWithItemName:@"周二"
                            withItemValue:2],
         [self getSelectModelWithItemName:@"周三"
                            withItemValue:3],
         [self getSelectModelWithItemName:@"周四"
                            withItemValue:4],
         [self getSelectModelWithItemName:@"周五"
                            withItemValue:5],
         [self getSelectModelWithItemName:@"周六"
                            withItemValue:6],
         [self getSelectModelWithItemName:@"周日"
                            withItemValue:7]
     ];
     // Do any additional setup after loading the view.
}
-(FYSlideSelectModel *)getSelectModelWithItemName:(NSString *)name withItemValue:(NSInteger)itemvalue{
    FYSlideSelectModel *model = [[FYSlideSelectModel alloc]init];
    model.itemName = name;
    model.itemValue = itemvalue;
    return model;
}
-(void)clickCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)clickSave{
    
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
