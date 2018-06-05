//
//  ViewController.m
//  TableViewProject
//
//  Created by Admin on 2018/6/5.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TestCell.h"
#import "AutoController.h"
#import "HeaderController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addConstraintsAndActions];
    
}

#pragma mark - creatUI lazy

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"sectionView+headerView+footerView";
        
    }else if (indexPath.row == 1) {
        
        cell.textLabel.text = @"cell上label富文本+cell高度自适应";

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {


        [self.navigationController pushViewController:[HeaderController new] animated:YES];
        
    }else if (indexPath.row == 1) {
        
        [self.navigationController pushViewController:[AutoController new] animated:YES];
        
    }
}

#pragma mark - buttonAction


#pragma mark - data



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
