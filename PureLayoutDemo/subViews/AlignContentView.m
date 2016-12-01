//
//  AlignContentView.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/8.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "AlignContentView.h"
@interface AlignContentView ()

@property (nonatomic, strong) UILabel *blueLabel;
@property (nonatomic, strong) UILabel *redLabel;
@property (nonatomic, strong) UILabel *yellowLabel;
@property (nonatomic, strong) UILabel *purpleLabel;
@end
@implementation AlignContentView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setupSubViews];
        
    }
    
    return self;
}
#pragma mark - Setup

- (void)setupSubViews{
    
    [super setupSubViews];
    [self addSubview:self.blueLabel];
    [self addSubview:self.redLabel];
    [self addSubview:self.yellowLabel];
    [self addSubview:self.purpleLabel];
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{

    if (!self.didSetupConstraints)
    {

        [self.blueLabel autoCenterInSuperview];
        
        [self autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.blueLabel withOffset:50];
        [self.blueLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.blueLabel withOffset:0];
        [self.redLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.blueLabel withOffset:50];
        [self.redLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.redLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0];
        [self.redLabel autoSetDimension:ALDimensionHeight toSize:20];

        
        [self.yellowLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.redLabel withMultiplier:0.5];
        [self.yellowLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.yellowLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0];
        [self.yellowLabel autoSetDimension:ALDimensionHeight toSize:20];
        
        
        [self.purpleLabel autoCenterInSuperview];
        [self.purpleLabel autoSetDimensionsToSize:CGSizeMake(100, 100)];

        
    }
    
            [super updateConstraints];
}

- (UILabel *)blueLabel{

    if (!_blueLabel) {
        _blueLabel = [self colorView:[UIColor blueColor] andText:@"居中，长宽一致，supreview设置内边距"];

    }
    return _blueLabel;
}
- (UILabel *)redLabel{

    if (!_redLabel) {
        _redLabel = [self colorView:[UIColor redColor] andText:@"横向居中，垂直约束在蓝色view中心下50"];
       
    }
    return _redLabel;
}
- (UILabel *)yellowLabel{

    if (!_yellowLabel) {
        _yellowLabel = [self colorView:[UIColor yellowColor]andText:@"横向居中，垂直约束在红色view中心＊0.5"];

    }
    return _yellowLabel;
}
- (UILabel *)purpleLabel{

    if (!_purpleLabel) {
        _purpleLabel = [self colorView:[UIColor purpleColor] andText:@"居中，长宽给定值100"];

    }
    
    return _purpleLabel;
}

@end
