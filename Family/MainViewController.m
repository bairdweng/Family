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
#import "WKViewController.h"
#import "WKShowViewController.h"
#import "WKModel.h"
#import "BaseNavigationController.h"
@interface MainViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *_dataSource;
    UITableView* _tableView;
}
@end

@implementation MainViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadDatas];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的事务";
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view);
    }];
    [tableView registerClass:[CardCell class] forCellReuseIdentifier:@"cardcell"];
    __weak typeof(self) weakself = self;
    FixButton *button = [[FixButton alloc]initWithImageName:@"add" withPosition:FixButtonPositionBottomRight withEvents:^(UIButton *button) {
        WKModel *model = [[WKModel alloc]init];;
        WKViewController *viewController = [[WKViewController alloc]init];
        viewController.title = @"添加事务";
        viewController.model = model;
        BaseNavigationController *naivigation = [[BaseNavigationController alloc]initWithRootViewController:viewController];
        [weakself presentViewController:naivigation animated:YES completion:nil];
    }];
    [self.view addSubview:button];
    [button updateTheLayout];
    _dataSource = [WKModel getTempleDatas];
    UIView *HeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    [tableView setTableHeaderView:HeaderView];
    UIView *FooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [tableView setTableFooterView:FooterView];
    _tableView = tableView;


    // Do any additional setup after loading the view, typically from a nib.
}
-(void)reloadDatas{
    _dataSource = [WKModel findWithFormat:@"WHERE recordId = '%d'", 1];
    [_tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardcell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    WKModel *model = _dataSource[indexPath.row];
    cell.model = model;
    return cell;
}
-(void)editRecordWithModel:(WKModel *)model{
    WKShowViewController *viewController = [[WKShowViewController alloc]init];
    viewController.title = model.title;
    viewController.model = model;
    [self.navigationController pushViewController:viewController animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self editRecordWithModel:_dataSource[indexPath.row]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
