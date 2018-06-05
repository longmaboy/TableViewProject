//
//  HeaderController.m
//  TableViewProject
//
//  Created by Admin on 2018/6/5.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import "HeaderController.h"
#import "Masonry.h"
#import "HeaderSectionView.h"
#import "TableHeaderView.h"

@interface HeaderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) TableHeaderView * tableViewHeaderView;

@property (nonatomic, strong) NSArray * headSectionArr;

@end

@implementation HeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"sectionView+headerView+footerView";
    
    _headSectionArr = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", nil];
    

    [self addConstraintsAndActions];
    
}


#pragma mark - creatUI lazy

- (UITableView *)tableView
{
    if (!_tableView) {
        //使用UITableViewStylePlain模式下有组头sectionView时组头会悬浮，UITableViewStyleGrouped不会悬浮
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
        _tableView.tableFooterView = [UIView new];
        
        _tableView.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        
        //iOS8.0以上
        _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        _tableViewHeaderView = [[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200)];
        _tableViewHeaderView.titleLabel.text = @"立即登录";
        _tableView.tableHeaderView = _tableViewHeaderView;
                
    }
    return _tableView;
}


#pragma mark - layout
- (void)addConstraintsAndActions
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - delegateMethod

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.headSectionArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell->%ld",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
}

//iOS11之后需要调用下面2个viewForHeader、viewForFooter代理方法才能对header、footer高度设置起作用
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderSectionView *headerView = [[HeaderSectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 30)];
    headerView.titleLabel.text = self.headSectionArr[section];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}



#pragma mark - buttonAction


#pragma mark - data



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
