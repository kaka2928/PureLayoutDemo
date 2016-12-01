//
//  AnimationContentView.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/25.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "AnimationContentView.h"

@interface AnimationContentView(){

    BOOL _isContract;
    NSInteger _animationCount;
}

@property (nonatomic, strong) UILabel *blueLabel;
@property (nonatomic, strong) UILabel *redLabel;
@property (nonatomic, strong) UILabel *yellowLabel;
@property (nonatomic, strong) UILabel *purpleLabel;


@property (nonatomic, strong) NSLayoutConstraint *blueHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *yellowTopConstraint;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation AnimationContentView


- (instancetype)init{
    
    if (self = [super init]) {
        
        self.layer.borderColor = [[UIColor blackColor]CGColor];
        self.layer.borderWidth = 1.0;
        [self setupSubViews];
        _animationCount = 5;
    }
    
    return self;
}
#pragma mark - Setup

- (void)setupSubViews{
    
    [super setupSubViews];
    [self addSubview:self.blueLabel];
    [self addSubview:self.redLabel];
    [self addSubview:self.yellowLabel];
}
#pragma mark - API
- (void)startAnimation{

    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timeToUpdateConstraint:) userInfo:nil repeats:YES];
    }
}
- (void)timeToUpdateConstraint:(NSTimer *)timer{


    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:0
                     animations:^{
                         [self layoutSubviews];

                     }
                     completion:^(BOOL finished) {

                          _isContract =!_isContract;
                     }];


    
}
#pragma mark - subviews
- (UILabel *)blueLabel{
    
    if (!_blueLabel) {
        _blueLabel = [self colorView:[UIColor blueColor] andText:@"居中，同长宽，定时改变宽度constraint"];
        _blueLabel.numberOfLines = 0;
        
    }
    return _blueLabel;
}
- (UILabel *)redLabel{
    
    if (!_redLabel) {
        _redLabel = [self colorView:[UIColor redColor] andText:@"贴底边，宽度受蓝色label的宽约束"];
        _redLabel.numberOfLines = 0;
    }
    return _redLabel;
}
- (UILabel *)yellowLabel{
    
    if (!_yellowLabel) {
        _yellowLabel = [self colorView:[UIColor yellowColor]andText:@"纵向布局居中，顶部与蓝色label间隔作为animation改变参数"];
        
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
        [self.blueLabel autoCenterInSuperview];
//        [self.blueLabel autoSetDimension:ALDimensionHeight toSize:50];
        self.blueHeightConstraint = [self.blueLabel autoSetDimension:ALDimensionWidth toSize:100];
        [self.blueLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.blueLabel withOffset:0];
        
        [self.redLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.redLabel autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:self.blueLabel];
        
        self.yellowTopConstraint = [self.yellowLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.blueLabel];
        [self.yellowLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
    }
    self.blueHeightConstraint.constant = (_isContract)?100:200;
    self.yellowTopConstraint.constant = (_isContract)?0:20;
    [super updateConstraints];
}

@end
