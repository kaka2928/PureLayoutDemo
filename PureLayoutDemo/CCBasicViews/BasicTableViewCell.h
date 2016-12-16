//
//  BasicTableViewCell.h
//  PureLayoutDemo
//
//  Created by caochao on 16/12/15.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  autolayout tableViewCell 基类，
 
 
    1.子类中只需要重写setupSubViews方法进行subviews的添加；
    2.子类中layoutSubviews、info、updateConstraints 要调用super方法
 */
@interface BasicTableViewCell : UITableViewCell
/**
 *  获取autolayout cell的真实高度
 *
 *  @param cellViewWidth tableView 的宽度，由于cell高度pin布局，使用自动拉伸，cell宽度必须给定
 *
 *  @return cell真实高度
 */
- (CGFloat)realCellHeight:(CGFloat)cellViewWidth;
@property (nonatomic,assign) BOOL didSetupConstraints;
/**
 *  cell的info，子类中调用[super setInfo:info]
 */
@property (nonatomic,retain) NSDictionary *info;
@end
