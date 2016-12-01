//
//  ContentView.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/24.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "ContentView.h"

@interface ContentView()

@property (nonatomic,retain) UILabel *titleLabel;

@end

@implementation ContentView

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.layer.borderColor = [[UIColor blackColor]CGColor];
        self.layer.borderWidth = 1.0;
        
    }
    
    return self;
}
#pragma mark - Setup
- (void)setupSubViews{

    [super setupSubViews];
    [self addSubview:self.titleLabel];
}
#pragma mark - subviews
- (UILabel *)titleLabel{

    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.font = [UIFont systemFontOfSize:16];

    }
    return _titleLabel;
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    
    if (!self.didSetupConstraints)
    {
        
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
        [self.titleLabel autoSetDimension:ALDimensionHeight toSize:16];

    }
    [super updateConstraints];
    
}

- (void)setTitle:(NSString *)title{

    if (title!=nil) {
        _title = title;
        _titleLabel.text = title;
        
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
}
- (UILabel *)colorView:(UIColor *)color andText:(NSString *)text{
    
    UILabel *colorView = [UILabel newAutoLayoutView];
    colorView.layer.borderColor = [color CGColor];
    colorView.textAlignment =NSTextAlignmentCenter;
    colorView.textColor = color;
    colorView.font = [UIFont systemFontOfSize:12];
    colorView.layer.borderWidth = 1.0;
    colorView.text = text;
    return colorView;
}
@end
