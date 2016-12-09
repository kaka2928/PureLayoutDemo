//
//  ContentTableViewCell.h
//  PureLayoutDemo
//
//  Created by caochao on 16/12/5.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentTableViewCell : UITableViewCell
- (CGFloat)getRealHeight:(CGFloat)tableviewWidth;
@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,retain) NSDictionary *info;
@end
