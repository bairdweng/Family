//
//  BaseNavigationController.m
//  Family
//
//  Created by Baird-weng on 2017/10/24.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIColor+Hex.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController
-(void)setConfig{
    UIImage *Navimage = [self imageWithColor:[UIColor colorWithNavigation] size:CGSizeMake(self.view.frame.size.width, 64)];
    [self.navigationBar setBackgroundImage:Navimage forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
}
//绘制单色的图片
-(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    @autoreleasepool {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context,color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setConfig];
    // Do any additional setup after loading the view.
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
