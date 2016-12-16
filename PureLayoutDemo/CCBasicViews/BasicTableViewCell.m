//
//  BasicTableViewCell.m
//  PureLayoutDemo
//
//  Created by caochao on 16/12/15.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "BasicTableViewCell.h"

@implementation BasicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}
- (instancetype)init{
    
    if (self = [super init]) {
        [self setupSubViews];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];

}
#pragma mark - Setup

- (void)setupSubViews{

}
#pragma mark - subviews

#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {
        

        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
    
}
- (CGFloat)realCellHeight:(CGFloat)tableViewWidth{
    
    self.bounds = CGRectMake(0.0f, 0.0f, tableViewWidth, CGRectGetHeight(self.bounds));
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize contentSize = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    CGFloat height = contentSize.height;
    NSLog(@"%f,%f,%f,%f",tableViewWidth,CGRectGetHeight(self.bounds),contentSize.width,height);
    return height+1;
}

- (void)setInfo:(NSDictionary *)info{
    
    if (info !=nil) {
        _info = info;

        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    
}

@end
