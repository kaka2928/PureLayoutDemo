//
//  PinContentView.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/24.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "PinContentView.h"

@interface PinContentView()

@property (nonatomic, strong) UILabel *blueLabel;
@property (nonatomic, strong) UILabel *redLabel;
@property (nonatomic, strong) UILabel *yellowLabel;
@property (nonatomic, strong) UILabel *purpleLabel;

@end

@implementation PinContentView


- (instancetype)init{
    
    if (self = [super init]) {
        
        self.layer.borderColor = [[UIColor blackColor]CGColor];
        self.layer.borderWidth = 1.0;
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
#pragma mark - subviews
- (UILabel *)blueLabel{
    
    if (!_blueLabel) {
        _blueLabel = [self colorView:[UIColor blueColor] andText:@"3边给pin间距20，底部约束放空"];
        
    }
    return _blueLabel;
}
- (UILabel *)redLabel{
    
    if (!_redLabel) {
        _redLabel = [self colorView:[UIColor redColor] andText:@"4边给pin间距50"];
        
    }
    return _redLabel;
}
- (UILabel *)yellowLabel{
    
    if (!_yellowLabel) {
        _yellowLabel = [self colorView:[UIColor yellowColor]andText:@"4边给pin值0"];
        
    }
    return _yellowLabel;
}
- (UILabel *)purpleLabel{
    
    if (!_purpleLabel) {
        _purpleLabel = [self colorView:[UIColor purpleColor] andText:@"3边给pin间距20，顶部约束放空，与蓝色进行200间隔pin"];
        
    }
    
    return _purpleLabel;
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {

//        [self.blueLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
        [self.blueLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(40, 20, 20, 20) excludingEdge:ALEdgeBottom];
        
        [self.redLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(50, 50, 50, 50)];
        
        [self.yellowLabel autoPinEdgesToSuperviewEdges];
        
//        [self.purpleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
        [self.purpleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(40, 20, 20, 20) excludingEdge:ALEdgeTop];
        [self.purpleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.blueLabel withOffset:200];
        
    }
    
    [super updateConstraints];
}

@end
