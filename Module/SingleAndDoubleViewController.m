//
//  SingleAndDoubleViewController.m
//  Family
//
//  Created by Baird-weng on 2017/10/31.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//
#import "SingleAndDoubleViewController.h"
#import "FYHeader.h"
#import "SettingDataBase.h"
#import "FYDateResult.h"
#import <FScalendar/FScalendar.h>
@interface SingleAndDoubleViewController ()<FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance>
@property (weak, nonatomic) FSCalendar *calendar;
@property (weak, nonatomic) UILabel* stateLabel;

@end

@implementation SingleAndDoubleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查看什么时候双休";
    UILabel *stateLabel = [UILabel new];
    stateLabel.textAlignment = 1;
    stateLabel.text = @"--";
    stateLabel.font = [UIFont systemFontOfSize:25];
    stateLabel.textColor = [UIColor colorWithNavigation];
    [self.view addSubview:stateLabel];
    self.stateLabel = stateLabel;
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@64);
        make.left.right.equalTo(@0);
        make.height.equalTo(@50);
    }];
    FSCalendar* calendar = [FSCalendar new];
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.swipeToChooseGesture.enabled = YES;
    [self.view addSubview:calendar];
    self.calendar = calendar;
    [self.calendar mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(stateLabel.mas_bottom).equalTo(@5);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@350);
    }];
    // Do any additional setup after loading the view.
}
- (void)calendar:(FSCalendar*)calendar didSelectDate:(NSDate*)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSString* dateStr = [date formattedDateWithFormat:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
    self.stateLabel.text = [NSString stringWithFormat:@"%@ %@", dateStr, [FYDateResult getResultStringByDate:date]];
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

