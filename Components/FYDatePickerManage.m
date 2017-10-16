//
//  FYDatePickerManage.m
//  Family
//
//  Created by Baird-weng on 2017/10/16.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYDatePickerManage.h"
#import "FYDatePicker.h"
#import "FYHeader.h"
@interface FYDatePickerManage ()
@property(nonatomic,weak)FYDatePicker *datapickerView;

@property(nonatomic,strong)resultdate resultdate;
@end


@implementation FYDatePickerManage
-(void)KwdatePickCurrentTarget:(id)Target withDate:(NSDate *)date withresultDate:(resultdate)result{
    UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
    [currentWindow addSubview:self.view];
    [Target addChildViewController:self];
    self.resultdate = result;
    
    
    FYDatePicker *View = [[FYDatePicker alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:View];
    self.datapickerView = View;
    [self.datapickerView.DatePicker setDate:date animated:YES];
    [self.datapickerView.leftBtn addTarget:self action:@selector(ClickOntheTapformFYDatePicker) forControlEvents:UIControlEventTouchUpInside];
    
    [self.datapickerView.RightBtn addTarget:self action:@selector(ClickOntheEnter) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ClickOntheTapformFYDatePicker)];
    [self.view  addGestureRecognizer:Tap];
}
-(void)setDatePickerMode:(UIDatePickerMode *)datePickerMode{
    _datePickerMode = datePickerMode;
    self.datapickerView.DatePicker.datePickerMode = datePickerMode;
}
-(void)ClickOntheTapformFYDatePicker{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.datapickerView.backgroundView.frame;
        rect.origin.y = ScreenHeight;
        self.datapickerView.backgroundView.frame = rect;
    }completion:^(BOOL finished) {
        [self.presentedViewController removeFromParentViewController];
        [self.view removeFromSuperview];
    }];
}
-(void)ClickOntheEnter{
    [self ClickOntheTapformFYDatePicker];
    if (self.resultdate) {
        self.resultdate(self.datapickerView.DatePicker.date);
    }
}
@end
