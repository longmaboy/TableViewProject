//
//  TestCell.m
//  TestProject
//
//  Created by Admin on 2018/6/5.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import "TestCell.h"
#import "Masonry.h"
#import "NSString+MString.h"

@interface TestCell()
@property (nonatomic, strong) UILabel * detailLabel;

@end

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self addConstraintsAndActions];
        
    }
    return self;
}


#pragma mark - creatUI lazy

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.textAlignment = NSTextAlignmentJustified;
        _detailLabel.numberOfLines = 0;
        [self addSubview:_detailLabel];
    }
    return _detailLabel;
}


#pragma mark - layout
- (void)addConstraintsAndActions
{
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(8);
        make.right.bottom.equalTo(self).offset(-8);
    }];
}

#pragma mark - buttonAction


#pragma mark - data
//set方法赋值
- (void)setDetailLabelString:(NSString *)detailLabelString
{
    if (_detailLabelString != detailLabelString) {
        _detailLabelString = detailLabelString;
    }
    
    _detailLabel.text = detailLabelString;
    
    _detailLabel.attributedText = [detailLabelString stringWithParagraphlineSpeace:4 andLabel:self.detailLabel];
    
}

@end
