//
//  AutoController.m
//  TestProject
//
//  Created by Admin on 2018/6/5.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import "AutoController.h"
#import "Masonry.h"
#import "TestCell.h"

@interface AutoController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@end

@implementation AutoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"cell上label富文本+cell高度自适应";
    
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
        
        _tableView.tableFooterView = [UIView new];
        
        _tableView.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
        
        //iOS8.0以上
        _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        
        [_tableView registerClass:[TestCell class] forCellReuseIdentifier:@"TestCell"];
        
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
    static NSString *identifier = @"TestCell";
    
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    cell.detailLabelString = [NSString stringWithFormat:@"cell->%ld在5月18日至19日全国生态环境保护大会上，习近平总书记发表重要讲话。讲话中强调生态文明建设正处于关键期、攻坚期、窗口期；生态环境是关系党的使命宗旨的重大政治问题，也是关系民生的重大社会问题。新时代推进我国生态文明建设，必须坚持六个原则：第一，坚持人与自然和谐共生，坚持节约优先、保护优先、自然恢复为主的方针。第二，绿水青山就是金山银山，贯彻创新、协调、绿色、开放、共享的发展理念。第三，良好生态环境是最普惠的民生福祉，坚持生态惠民、生态利民、生态为民。第四，山水林田湖草是生命共同体，要统筹兼顾、整体施策、多措并举，全方位、全地域、全过程开展生态文明建设。第五，用最严格制度最严密法治保护生态环境，让制度成为刚性的约束和不可触碰的高压线。第六，共谋全球生态文明建设，深度参与全球环境治理，形成世界环境保护和可持续发展的解决方案，引导应对气候变化国际合作。",indexPath.row];
    
    return cell;
}

#pragma mark - buttonAction


#pragma mark - data



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
