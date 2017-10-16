//
//  WorkingViewController.m
//  Family
//
//  Created by Baird-weng on 2017/9/4.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "WKViewController.h"
#import "FYCheckBox.h"
#import "FYHeader.h"
#import "WKCell.h"
#import "DateTools.h"
#import "FYDatePickerManage.h"
#import "WKModel.h"
@interface WKViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSArray *_dataSource;
    NSMutableArray *_checkBoxModels;
    
}
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation WKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(clickCancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(clickSave)];
    
    
    WKModel *model1 = [[WKModel alloc]init];
    model1.title = @"重复";
    model1.details = @"";
    
    WKModel* model2 = [[WKModel alloc] init];
    model2.title = @"提醒时间";
    model2.details = @"";
    _dataSource = @[model1,model2];
    [self initView];
    // Do any additional setup after loading the view.
}
-(void)initView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view);
    }];
    [tableView registerClass:[WKCell class] forCellReuseIdentifier:@"cell"];
    [tableView registerNib:[UINib nibWithNibName:@"WKCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"WKCell"];
    self.tableView = tableView;
    [self setTableViewHeaderView];
}
-(void)setTableViewHeaderView{
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    textField.placeholder = @"请输入要提醒的事情";
    textField.leftViewMode = UITextFieldViewModeAlways;
    [textField setLeftView: [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 0)]];
    [self.tableView setTableHeaderView:textField];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSource count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    WKModel *model = _dataSource[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.contentLabel.text = model.details;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            FYCheckBox *checkBox = [[FYCheckBox alloc]init];
            checkBox.title = @"设置重复周期";
            [checkBox initDataSources:[self getCheckDataSource]
                            withBlock:^(NSArray<FYCheckBoxModel*>* datas) {
                                _checkBoxModels = [[NSMutableArray alloc]initWithArray:datas];
                                [self reloadRepeats];
                            }];
            [self.navigationController pushViewController:checkBox animated:YES];
        }
            break;
        case 1:{
            FYDatePickerManage *dataPicker = [[FYDatePickerManage alloc]init];
            [dataPicker KwdatePickCurrentTarget:self withDate:[NSDate date] withresultDate:^(NSDate *currentdate) {
                NSString *dateString = [currentdate formattedDateWithFormat:@"hh:ss"];
                WKModel *model = _dataSource[indexPath.row];
                model.details = dateString;
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
            dataPicker.datePickerMode = UIDatePickerModeTime;
        }
            break;
        default:
            break;
    }
}
-(void)reloadRepeats{
    NSString *rstr = [[NSString alloc]init];
    for (int i = 0; i < _checkBoxModels.count; i++) {
        FYCheckBoxModel* checkBox = _checkBoxModels[i];
        if(checkBox.isSelect){
            rstr = [rstr stringByAppendingString:[NSString stringWithFormat:@" %@",checkBox.checkBoxText]];
        }
    }
    WKModel *model = _dataSource[0];
    model.details = rstr;
    [self.tableView reloadData];
}
-(NSMutableArray<FYCheckBoxModel *> *)getCheckDataSource{
    if(!_checkBoxModels){
        _checkBoxModels = [[NSMutableArray alloc]initWithCapacity:7];
        NSArray *weeks = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
        for (NSString *week in weeks) {
            FYCheckBoxModel* model = [[FYCheckBoxModel alloc] init];
            model.checkBoxText = week;
            model.isSelect = NO;
            [_checkBoxModels addObject:model];
        }
    }
    return _checkBoxModels;
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
