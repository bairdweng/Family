//
//  SettingViewController.m
//  Family
//
//  Created by Baird-weng on 2017/10/25.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "SettingViewController.h"
#import "FYSettingCell.h"
#import "FYHeader.h"
@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView* dataTableView;
@property (nonatomic, strong) NSMutableArray* dataSource;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:self.dataTableView];
    [self.dataTableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view);
    }];
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    [self.dataTableView registerClass:[FYSettingCell class] forCellReuseIdentifier:@"FYSettingCell"];
    [self initModels];
    // Do any additional setup after loading the view from its nib.
}
-(void)initModels{
    if(!self.dataSource){
        self.dataSource = [[NSMutableArray alloc] init];
    }
    [self.dataSource removeAllObjects];
    NSArray* att = @[ @"设置", @"设置", @"设置", @"设置" ];
    for (int i = 0; i<[att count]; i++) {
        FYSettingModel *model = [[FYSettingModel alloc]init];
        model.title = att[i];
        [self.dataSource addObject:model];
    }
    [self.dataTableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    FYSettingCell* cell = [tableView dequeueReusableCellWithIdentifier:@"FYSettingCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.model = self.dataSource[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [self editRecordWithModel:_dataSource[indexPath.row]];
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

