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
#import "WKModel.h"
#import "BaseNavigationController.h"
#import "FYLocalNotification.h"
#import "SettingViewController.h"
#import "FYCheckCell.h"
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
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
    [rightBtn setImage:[UIImage imageNamed:@"setting_navigation"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickOntheRigtBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view);
    }];
    [tableView registerClass:[CardCell class] forCellReuseIdentifier:@"cardcell"];
    __weak typeof(self) weakself = self;
    FixButton *button = [[FixButton alloc]initWithImageName:@"add" withPosition:FixButtonPositionBottomMiddle withEvents:^(UIButton *button) {
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
    [[FYLocalNotification sharedManager] showMessageTitle:@"提醒" WithBody:@"卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽卧槽"];
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
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CardCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cardcell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    WKModel *model = _dataSource[indexPath.row];
    cell.model = model;
    return cell;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self editRecordWithModel:_dataSource[indexPath.row]];
}
- (void)editRecordWithModel:(WKModel*)model{
    NSArray *ratt = [model.repeats mj_JSONObject];
    model.repeats = [FYCheckBoxModel mj_objectArrayWithKeyValuesArray:ratt];
    WKViewController* viewController = [[WKViewController alloc] init];
    viewController.title = model.title;
    viewController.model = model;
    viewController.editorState = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath{
    return UITableViewCellEditingStyleDelete;
}
//先要设Cell可编辑
- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath{
    return YES;
}
- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        WKModel *model = _dataSource[indexPath.row];
        [WKModel deleteObjectsWithFormat:@"WHERE udid = '%@'",model.udid];
        _dataSource = [WKModel findWithFormat:@"WHERE recordId = '%d'", 1];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
-(void)clickOntheRigtBtn{
    SettingViewController *settingViewController = [[SettingViewController alloc]init];
    settingViewController.title = @"设置";
    [self.navigationController pushViewController:settingViewController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
