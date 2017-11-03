//
//  TodayViewController.m
//  FYToday
//
//  Created by Baird-weng on 2017/11/2.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "FYHeader.h"
#import <FScalendar/FScalendar.h>

@interface TodayViewController () <NCWidgetProviding, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance>
@property (nonatomic, weak) UIButton* textBtn;
@property (nonatomic, weak) UIButton* showCalendar;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    self.textBtn = btn;
    [self.textBtn addTarget:self action:@selector(pushMainApp) forControlEvents:UIControlEventTouchUpInside];

    UIButton *showCalendar = [UIButton buttonWithType:UIButtonTypeCustom];
    showCalendar.backgroundColor = [UIColor colorWithNavigation];
    [showCalendar.titleLabel setFont:[UIFont systemFontOfSize:14]];
    showCalendar.layer.cornerRadius = 10;
    [showCalendar setTitle:@"单双周日历" forState:UIControlStateNormal];
    [self.view addSubview:showCalendar];
    [showCalendar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textBtn.mas_bottom).equalTo(@15);
        make.width.equalTo(@85);
        make.height.equalTo(@40);
        make.centerX.equalTo(btn);
    }];
    self.showCalendar = showCalendar;
    [self.showCalendar addTarget:self action:@selector(pushCalendarView) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)pushMainApp
{
    [self.extensionContext openURL:[NSURL URLWithString:@"FamilyPro://setRest"] completionHandler:nil];
}
-(void)pushCalendarView{
    [self.extensionContext openURL:[NSURL URLWithString:@"FamilyPro://calendarView"] completionHandler:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake(maxSize.width, 110);

    } else {
        self.preferredContentSize = CGSizeMake(maxSize.width, 130);
    }
}
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    NSUserDefaults* userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.family.app"];
    [self.textBtn setTitle:[NSString stringWithFormat:@"本周 %@", [userDefault objectForKey:@"stateStr"]] forState:UIControlStateNormal];
    completionHandler(NCUpdateResultNewData);
}

@end
