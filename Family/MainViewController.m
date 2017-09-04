//
//  ViewController.m
//  Family
//
//  Created by Baird-weng on 2017/8/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//
#import "MainViewController.h"
#import "FYHeader.h"
#import "CardCell.h"
#import "MainTableViewCell.h"
#import "FixButton.h"
#import "WorkingViewController.h"
@interface MainViewController () <UITableViewDelegate, UITableViewDataSource> {
}
@end
@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的事务";
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view);
    }];
    [tableView registerClass:[CardCell class] forCellReuseIdentifier:@"cardcell"];
    __weak typeof(self) weakself = self;
    FixButton *button = [[FixButton alloc]initWithImageName:@"add" withPosition:FixButtonPositionBottomRight withEvents:^(UIButton *button) {
        WorkingViewController *viewController = [[WorkingViewController alloc]init];
        viewController.title = @"添加事务";
        UINavigationController *naivigation = [[UINavigationController alloc]initWithRootViewController:viewController];
        [weakself presentViewController:naivigation animated:YES completion:nil];
    }];
    [self.view addSubview:button];
    [button updateTheLayout];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardcell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"1212";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
