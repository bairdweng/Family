//
//  FYCheckBox.m
//  Family
//
//  Created by Baird-weng on 2017/9/15.
//  Copyright © 2017年 Baird-weng. All rights reserved.
//

#import "FYCheckBox.h"
#import "FYHeader.h"

@interface FYCheckBox () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView* tableView;
@end

@implementation FYCheckBox

-(void)viewDidLoad{
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView = tableView;
    [tableView registerNib:[UINib nibWithNibName:@"FYCheckCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"FYCheckCell"];
}
-(void)setDataSource:(NSArray<FYCheckBoxModel *> *)dataSource{
    _dataSource = dataSource;
    [self.tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FYCheckCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FYCheckCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    FYCheckBoxModel *model = _dataSource[indexPath.row];
    cell.model = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FYCheckBoxModel *model = _dataSource[indexPath.row];
    model.isSelect = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
