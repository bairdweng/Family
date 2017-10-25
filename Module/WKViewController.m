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
    UITextField *_textField;
    FSTextView* _textView;
    NSString* _dateString;
}
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation WKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if(!self.editorState){
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(clickCancel)];
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(clickSave)];
    WKModel *model1 = [[WKModel alloc]init];
    model1.title = @"重复";
    model1.details = @"";
    WKModel* model2 = [[WKModel alloc] init];
    model2.title = @"提醒时间";
    model2.details = @"";
    _dataSource = @[model1,model2];
    [self initView];
    [self reloadRepeats];
    // Do any additional setup after loading the view.
}
-(void)setModel:(WKModel *)model{
    _model = model;
    _textField.text = model.details;
    if(model.repeats&&model.repeats.count>0){
        _checkBoxModels = [[NSMutableArray alloc] initWithArray:model.repeats];
    }
    else{
        _checkBoxModels = [self getCheckDataSource];
    }
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
    UIView *headerView = [UIView new];
    _textField = [UITextField new];
    [headerView addSubview:_textField];
    _textField.placeholder = @"请输入要提醒的事情";
    _textField.leftViewMode = UITextFieldViewModeAlways;
   
    [_textField setLeftView: [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)]];
    [_textField mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.left.right.equalTo(headerView);
        make.height.equalTo(@44);
    }];
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithLine];
    [headerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@44);
        make.height.equalTo(@0.5);
        make.left.right.equalTo(headerView);
    }];
    _textView = [FSTextView textView];
    _textView.placeholder = @"输入内容";
    _textView.backgroundColor = [UIColor clearColor];
    _textView.font = [UIFont systemFontOfSize:17];
    [headerView addSubview:_textView];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@45.5);
        make.left.equalTo(@5);
        make.right.equalTo(@(-5));
        make.height.equalTo(@80);
        make.bottom.equalTo(headerView).offset(-5);
    }];
    CGRect frame = headerView.frame;
    CGFloat height = [headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    frame.size.height = height;
    headerView.frame = frame;
    if(self.editorState == YES){
        _textField.text = self.model.title;
        _textView.text = self.model.details;
    }
    self.tableView.tableHeaderView = headerView;
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
            __weak typeof(self)weakSelf = self;
            [checkBox initDataSources:[self getCheckDataSource]
                            withBlock:^(NSArray<FYCheckBoxModel*>* datas) {
                                _checkBoxModels = [[NSMutableArray alloc]initWithArray:datas];
                                [weakSelf reloadRepeats];
                            }];
            [self.navigationController pushViewController:checkBox animated:YES];
        }
            break;
        case 1:{
            FYDatePickerManage *dataPicker = [[FYDatePickerManage alloc]init];
            
            [dataPicker KwdatePickCurrentTarget:self
                                       withDate:[NSDate date]
                                 withresultDate:^(NSDate* currentdate) {
                                     NSString* dateString = [currentdate formattedDateWithFormat:@"HH:mm" timeZone:[NSTimeZone systemTimeZone]];
                                     _dateString = dateString;
                                     WKModel* model = _dataSource[indexPath.row];
                                     model.details = dateString;
                                     [tableView reloadRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationNone];
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
    [self dismissViewControllerAnimated:YES completion:nil];
    self.model.title = _textField.text;
    self.model.details = _textView.text;
    NSArray* dictArray = [FYCheckBoxModel keyValuesArrayWithObjectArray:(NSArray *)_checkBoxModels];
    self.model.repeats = dictArray;
    self.model.recordId = 1;
    self.model.udid = [self uuidString];
    self.model.remindTime = _dateString;

    [self.model save];
}
-(NSString*)uuidString{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    NSString* uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
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
