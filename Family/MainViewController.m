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
#import "FYNoticeManager.h"
#import "MainModel.h"
#import "SADModel.h"
#import "FunctionSADCell.h"
#import "SingleAndDoubleViewController.h"
@interface MainViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *_dataSource;
    UITableView* _tableView;
}
@end
@implementation MainViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadDatas];
    [_tableView reloadData];
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
    [tableView registerClass:[FunctionSADCell class] forCellReuseIdentifier:@"FunctionSADCell"];

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
  
    [self setTableViewHeader];
    UIView *FooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [tableView setTableFooterView:FooterView];
    _tableView = tableView;

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setTableViewHeader{
    UIView *HeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    [_tableView setTableHeaderView:HeaderView];
}
-(void)reloadDatas{
    if (!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
    }
    [_dataSource removeAllObjects];
    [_dataSource addObject:[self getSADModel]];
    NSArray* models = [WKModel findWithFormat:@"WHERE recordId = '%d'", 1];
    for (WKModel *model in models) {
        MainModel *m_model = [[MainModel alloc]init];
        m_model.stype = FunctionModuleTypeWorking;
        m_model.model = model;
        m_model.cellHeight = 80;
        [_dataSource addObject:m_model];
    }
    [[FYNoticeManager sharedManager] activation];
}

-(MainModel *)getSADModel
{
    MainModel *m_model = [[MainModel alloc]init];
    m_model.cellHeight = 44;
    m_model.stype = FunctionModuleTypeSingleAndDouble;
    SADModel* model = [[SADModel alloc] init];
    model.title = @"本周休息情况";
    model.details = @"单休";
    m_model.model = model;
    return m_model;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainModel* m_model = _dataSource[indexPath.row];
    return m_model.cellHeight;
}
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    MainModel* m_model = _dataSource[indexPath.row];
    switch (m_model.stype) {
    case FunctionModuleTypeWorking: {
        CardCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cardcell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        WKModel* model = (WKModel*)m_model.model;
        cell.model = model;
        return cell;
    }
            break;
    case FunctionModuleTypeSingleAndDouble: {
        FunctionSADCell* cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionSADCell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.model = m_model.model;
        return cell;
    }
            break;
        default:{
            return nil;
        }
            break;
    }
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainModel* m_model = _dataSource[indexPath.row];
    switch (m_model.stype) {
        case FunctionModuleTypeWorking:
            [self editRecordWithModel:m_model.model];
            break;
        case FunctionModuleTypeSingleAndDouble:{
            SingleAndDoubleViewController* ViewController = [[SingleAndDoubleViewController alloc] init];
            [self.navigationController pushViewController:ViewController animated:YES];
        }
            break;
        default:
            break;
    }
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
        MainModel* m_model = _dataSource[indexPath.row];
        switch (m_model.stype) {
        case FunctionModuleTypeWorking: {
            WKModel* model = m_model.model;
            [WKModel deleteObjectsWithFormat:@"WHERE udid = '%@'", model.udid];
            [[FYNoticeManager sharedManager] cleanLocalNoticationById:model.udid];
            [self reloadDatas];
            [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationLeft];
        }
            break;
            default:
                break;
        }
       
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

