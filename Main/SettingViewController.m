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
#import "SettingDataBase.h"
#import "FYDateResult.h"
@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView* dataTableView;
@property (nonatomic, strong) NSMutableArray* dataSource;
@property (nonatomic, strong) SettingDataBase* dataBaseModel;
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

    self.dataBaseModel = [SettingDataBase findByPK:1];
    if(!self.dataBaseModel){
        self.dataBaseModel = [[SettingDataBase alloc]init];
    }
    FYSettingModel *model1 = [[FYSettingModel alloc]init];
    model1.title = @"本周休息情况";
    model1.content = [FYDateResult getResultStringByDate:[NSDate date]];
    [self.dataSource addObject:model1];
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
    switch (indexPath.row) {
    case 0: {
        UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"本周休息时间" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"单休"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction* _Nonnull action) {
                                                            FYSettingModel* model = self.dataSource[indexPath.row];
                                                            model.content = @"单休";
                                                            self.dataBaseModel.restString = @"单休";
                                                            self.dataBaseModel.restState = 1;
                                                            self.dataBaseModel.lastTime = [[NSDate date] formattedDateWithFormat:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
                                                            [self.dataBaseModel saveOrUpdate];
                                                            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                                                            [FYDateResult Synchronize];
                                                        }];
        UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"双休"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction* _Nonnull action){
                                                           FYSettingModel* model = self.dataSource[indexPath.row];
                                                           model.content = @"双休";
                                                           self.dataBaseModel.restString = @"双休";
                                                           self.dataBaseModel.lastTime = [[NSDate date] formattedDateWithFormat:@"yyyy-MM-dd" timeZone:[NSTimeZone systemTimeZone]];
                                                           self.dataBaseModel.restState = 2;
                                                           [self.dataBaseModel saveOrUpdate];
                                                           [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                                                           [FYDateResult Synchronize];
                                                       }];
        UIAlertAction* action3 = [UIAlertAction actionWithTitle:@"取消"
                                                          style:UIAlertActionStyleCancel
                                                        handler:nil];
        [alertViewController addAction:action1];
        [alertViewController addAction:action2];
        [alertViewController addAction:action3];
        [self.navigationController presentViewController:alertViewController animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
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

