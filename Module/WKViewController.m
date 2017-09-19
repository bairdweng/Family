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
@interface WKViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSArray *_dataSource;
    
}
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation WKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(clickCancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(clickSave)];
    _dataSource = @[@{@"title":@"重复"},@{@"title":@"提醒时间"}];
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
    self.tableView = tableView;
    [self setTableViewHeaderView];
}
-(void)setTableViewHeaderView{
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    textField.placeholder = @"请输入要提醒的事情";
    [self.tableView setTableHeaderView:textField];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSource count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary *dicInfo = _dataSource[indexPath.row];
    cell.textLabel.text = dicInfo[@"title"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            FYCheckBox *checkBox = [[FYCheckBox alloc]init];
            checkBox.title = @"设置重复周期";
            checkBox.dataSource = [self getCheckDataSource];
            [self.navigationController pushViewController:checkBox animated:YES];
        }
            break;
            
        default:
            break;
    }
}
-(NSArray<FYCheckBoxModel *> *)getCheckDataSource{
    NSArray *weeks = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:7];
    for (NSString *week in weeks) {
        FYCheckBoxModel* model = [[FYCheckBoxModel alloc] init];
        model.checkBoxText = week;
        model.isSelect = NO;
        [muArray addObject:model];
    }
    return muArray;
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
