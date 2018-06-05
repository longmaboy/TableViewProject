//
//  TestCell.h
//  TestProject
//
//  Created by Admin on 2018/6/5.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell
//模拟赋值，实际情况这里可能是一个字典NSDictionay或者模型model
@property (nonatomic,   copy) NSString * detailLabelString;

@end
