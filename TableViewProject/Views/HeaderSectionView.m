//
//  HeaderSectionView.m
//  TableViewProject
//
//  Created by Admin on 2018/6/5.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import "HeaderSectionView.h"
#import "Masonry.h"

@interface HeaderSectionView ()

@end

@implementation HeaderSectionView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
    
        [self addConstraintsAndActions];
        
    }
    return self;
}


#pragma mark - creatUI lazy

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}


#pragma mark - layout
- (void)addConstraintsAndActions
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-8);
        make.top.bottom.equalTo(self);
    }];
}

#pragma mark - delegateMethod



#pragma mark - buttonAction


#pragma mark - data



@end
