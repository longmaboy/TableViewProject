//
//  TableHeaderView.m
//  TableViewProject
//
//  Created by Admin on 2018/6/5.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import "TableHeaderView.h"
#import "Masonry.h"

@implementation TableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor blueColor];
        
        [self addConstraintsAndActions];
        
    }
    return self;
}


#pragma mark - creatUI lazy

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}


#pragma mark - layout
- (void)addConstraintsAndActions
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(40);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(30);
    }];
}

#pragma mark - delegateMethod



#pragma mark - buttonAction


#pragma mark - data



@end
