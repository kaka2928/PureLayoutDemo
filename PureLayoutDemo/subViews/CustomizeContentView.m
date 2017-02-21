//
//  CustomizeContentView.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/25.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "CustomizeContentView.h"
#import "UIView+Presentation.h"
@interface CustomizeContentView(){

    __block NSLayoutConstraint *leftConstraint;
    __block NSLayoutConstraint *bottomConstraint;
    __block NSLayoutConstraint *rightConstraint;
    
    __block NSMutableArray *constraints;
}

@property (nonatomic, strong) UIButton *popButton;
@property (nonatomic, strong) UILabel *blueLabel;
@property (nonatomic, strong) UILabel *yellowLabel;
@property (nonatomic, strong) UILabel *greenLabel;
@end

@implementation CustomizeContentView


- (instancetype)init{
    
    if (self = [super init]) {

        [self setupSubViews];
    }
    
    return self;
}
#pragma mark - Setup

- (void)setupSubViews{
    
    [super setupSubViews];
    [self addSubview:self.popButton];
}
#pragma mark - subviews
- (UIButton *)popButton{

    if (!_popButton) {
        _popButton = [UIButton newAutoLayoutView];
        _popButton.backgroundColor = [UIColor redColor];
        _popButton.tag = 0;
        [_popButton addTarget:self action:@selector(popButtonOnselected:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popButton;
}
- (UILabel *)blueLabel{
    
    if (!_blueLabel) {
        _blueLabel = [self colorView:[UIColor blueColor] andText:@"顶部pin 间距0，动态加载，从左侧载入view，从左侧划出"];
        
        
    }
    return _blueLabel;
}
- (UILabel *)yellowLabel{

    if (!_yellowLabel) {
        _yellowLabel = [self colorView:[UIColor yellowColor] andText:@"底部pin 间距0，动态加载，从底部载入view，从底部划出"];
    }
    return _yellowLabel;
}
- (UILabel *)greenLabel{

    if (!_greenLabel) {
        _greenLabel = [self colorView:[UIColor greenColor] andText:@"顶部pin 间距100，动态加载，从顶部载入view，view从［0，0］变到［200，200］，从顶部划出"];
        _greenLabel.numberOfLines = 0;
        
    }
    return _greenLabel;
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {
        
        [self.popButton autoCenterInSuperview];
        [self.popButton autoSetDimensionsToSize:CGSizeMake(100, 100)];
    }
    
    [super updateConstraints];
}
- (void)popButtonOnselected:(UIButton *)sender{

    
    if (sender.tag == 0) {

        [self presentSubView:self.blueLabel originalConstraint:^NSLayoutConstraint *{
            leftConstraint =[self.blueLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self];
            [self.blueLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
            return leftConstraint;
        } targetValue:300 isAnimated:YES isSpring:YES complection:^(BOOL success) {
            NSLog(@"%d",success);
        }];

        
        [self presentSubView:self.yellowLabel originalConstraint:^NSLayoutConstraint *{
            bottomConstraint = [self.yellowLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self];
            [self.yellowLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
            return bottomConstraint;
        } targetValue:-200 isAnimated:YES isSpring:YES complection:^(BOOL success) {
            NSLog(@"%d",success);
        }];
        
        
        NSArray *greenValues = @[@200,@200,@300];
        
        [self presentSubView:self.greenLabel originalConstraints:^NSArray<NSLayoutConstraint *> *{
            
            constraints = [NSMutableArray new];
            NSLayoutConstraint *widthConstraint = [self.greenLabel autoSetDimension:ALDimensionWidth toSize:0];
            [constraints addObject:widthConstraint];
            NSLayoutConstraint *heightConstraint = [self.greenLabel autoSetDimension:ALDimensionHeight toSize:0];
            [constraints addObject:heightConstraint];
            
            NSLayoutConstraint *topConstraint = [self.greenLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self];
            [constraints addObject:topConstraint];
            
            return [constraints copy];
            
        } targetValues:greenValues isAnimated:YES isSpring:NO complection:^(BOOL success) {
            NSLog(@"%d",success);
        }];
        
    }else{
    
        [self dismissSubView:self.blueLabel constraint:leftConstraint targetValue:0 isAnimated:YES isSpring:YES  complection:^(BOOL success) {
            NSLog(@"%d",success);
        }];
        [self dismissSubView:self.yellowLabel constraint:bottomConstraint targetValue:0 isAnimated:YES  isSpring:YES complection:^(BOOL success) {
            NSLog(@"%d",success);
        }];
        NSArray *greenValues = @[@0,@0,@0];
        [self dismissSubView:self.greenLabel constraints:constraints targetValues:greenValues isAnimated:YES isSpring:NO  complection:^(BOOL success) {
            
            NSLog(@"%d",success);
        }];
    }
    sender.tag = 1-sender.tag;
    
}
@end
