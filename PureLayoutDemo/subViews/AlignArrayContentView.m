//
//  AlignArrayContentView.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/25.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "AlignArrayContentView.h"

@interface AlignArrayContentView()

@property (nonatomic, strong) UILabel *blueLabel;
@property (nonatomic, strong) UILabel *redLabel;
@property (nonatomic, strong) UILabel *yellowLabel;
@property (nonatomic, strong) UILabel *purpleLabel;

@property (nonatomic, strong) UILabel *whiteLabel;
@property (nonatomic, strong) UILabel *greenLabel;
@property (nonatomic,retain) UILabel *orangeLabel;
@property (nonatomic,retain) UILabel *cyanLabel;


@property (nonatomic, strong) UILabel *blueLabel_1;
@property (nonatomic, strong) UILabel *redLabel_1;
@property (nonatomic, strong) UILabel *yellowLabel_1;
@property (nonatomic, strong) UILabel *purpleLabel_1;
@property (nonatomic, strong) UILabel *whiteLabel_1;
@property (nonatomic, strong) UILabel *greenLabel_1;
@property (nonatomic,retain) UILabel *orangeLabel_1;
@property (nonatomic,retain) UILabel *cyanLabel_1;
@end

@implementation AlignArrayContentView


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
    [self addSubview:self.blueLabel_1];
    
    [self addSubview:self.redLabel];
    [self addSubview:self.redLabel_1];
    
    [self addSubview:self.yellowLabel];
    [self addSubview:self.yellowLabel_1];
    
    [self addSubview:self.purpleLabel];
    [self addSubview:self.purpleLabel_1];
    
    
    [self addSubview:self.whiteLabel];
    [self addSubview:self.whiteLabel_1];
    
    [self addSubview:self.greenLabel];
    [self addSubview:self.greenLabel_1];
}
#pragma mark - subviews
- (UILabel *)blueLabel{
    
    if (!_blueLabel) {
        _blueLabel = [self colorView:[UIColor blueColor] andText:@"顶部到superview 40间距，同组纵向居中对齐、右边对齐、高度50"];
        
    }
    return _blueLabel;
}
- (UILabel *)blueLabel_1{
    
    if (!_blueLabel_1) {
        _blueLabel_1 = [self colorView:[UIColor blueColor] andText:@"顶部与蓝色label间隔20,同组纵向居中对齐、右边对齐==与蓝色长度一样"];
        
    }
    return _blueLabel_1;
}
- (UILabel *)redLabel{
    
    if (!_redLabel) {
        _redLabel = [self colorView:[UIColor redColor] andText:@"顶部到蓝色label 20 间隔，右侧到superview 0 间隔，同组上边对齐"];
        
    }
    return _redLabel;
}
- (UILabel *)redLabel_1{
    
    if (!_redLabel_1) {
        _redLabel_1 = [self colorView:[UIColor redColor]andText:@"左侧到superview 0 间隔，右侧20间隔"];
        _redLabel_1.numberOfLines = 0;
    }
    return _redLabel_1;
}
- (UILabel *)yellowLabel{
    
    if (!_yellowLabel) {
        _yellowLabel = [self colorView:[UIColor yellowColor]andText:@"纵向布局，与superview、同组纵向居中，view间隔 80，高度自动、 居中对齐"];
        _yellowLabel.numberOfLines = 0;
    }
    return _yellowLabel;
}
- (UILabel *)yellowLabel_1{
    
    if (!_yellowLabel_1) {
        _yellowLabel_1 = [self colorView:[UIColor yellowColor] andText:@"纵向布局，与superview、同组纵向居中，view间隔 80"];
        _yellowLabel_1.numberOfLines = 0;
    }
    
    return _yellowLabel_1;
}
- (UILabel *)purpleLabel{

    if (!_purpleLabel) {
        _purpleLabel = [self colorView:[UIColor purpleColor] andText:@"横向布局，同组横向居中，view间隔 100，高度自动,与superview无间隔"];
       _purpleLabel.numberOfLines = 0;
    }
    return _purpleLabel;
}
- (UILabel *)purpleLabel_1{

    if (!_purpleLabel_1) {
        _purpleLabel_1 = [self colorView:[UIColor purpleColor] andText:@"横向布局，同组横向居中，view间隔 100"];
        _purpleLabel_1.numberOfLines = 0;
    }
    return _purpleLabel_1;
}
- (UILabel *)whiteLabel{

    if (!_whiteLabel) {
        _whiteLabel = [self colorView:[UIColor whiteColor] andText:@"横向布局，与superview底部贴边，同组横向居中，view间隔50，与superview间距 0 "];
        _whiteLabel.numberOfLines = 0;
    }
    return _whiteLabel;
}
- (UILabel *)whiteLabel_1{
    
    if (!_whiteLabel_1) {
        _whiteLabel_1 = [self colorView:[UIColor whiteColor] andText:@"同组横向居中，view间隔50"];
        _whiteLabel_1.numberOfLines = 0;
    }
    return _whiteLabel_1;
}
- (UILabel *)greenLabel{

    if (!_greenLabel) {
        _greenLabel = [self colorView:[UIColor greenColor] andText:@"纵向布局，与superview右侧贴边，同组纵向居中，view高度100，等分superview纵向位置"];
    }
    return _greenLabel;
}
- (UILabel *)greenLabel_1{
    
    if (!_greenLabel_1) {
        _greenLabel_1 = [self colorView:[UIColor greenColor] andText:@"同组纵向居中，view高度100"];
    }
    return _greenLabel_1;
}
- (UILabel *)orangeLabel{

    if (!_orangeLabel) {
        _orangeLabel = [self colorView:[UIColor orangeColor] andText:@"横向布局，与superview、同组纵向居中，view间隔 100，高度自动"];
        _orangeLabel.numberOfLines= 0 ;
    }
    return _orangeLabel;
}
- (UILabel *)orangeLabel_1{
    
    if (!_orangeLabel_1) {
        _orangeLabel_1 = [self colorView:[UIColor orangeColor] andText:@"横向布局，纵向居中，与superview、同组view间隔 100，高度自动"];
        _orangeLabel_1.numberOfLines= 0 ;
    }
    return _orangeLabel_1;
}
- (UILabel *)cyanLabel{

    if (!_cyanLabel) {
        _cyanLabel = [self colorView:[UIColor orangeColor] andText:@"横向布局，与superview、同组view间隔 100"];
        _cyanLabel.numberOfLines = 0;
    }
    return _cyanLabel;
}
- (UILabel *)cyanLabel_1{
    
    if (!_cyanLabel_1) {
        _cyanLabel_1 = [self colorView:[UIColor orangeColor] andText:@"横向布局，与superview、同组view间隔 100"];
        _cyanLabel_1.numberOfLines = 0;
    }
    return _cyanLabel_1;
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {
        
        NSArray *labels_1 = @[self.blueLabel,self.blueLabel_1];
        [[labels_1 firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [[labels_1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
        [labels_1 autoAlignViewsToAxis:ALAxisVertical];
        [labels_1 autoAlignViewsToEdge:ALEdgeLeft];
        [labels_1 autoSetViewsDimension:ALDimensionHeight toSize:50];
        [[labels_1 lastObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:[labels_1 firstObject] withOffset:20];
        
        NSArray *labels_2 = @[self.redLabel,self.redLabel_1];
        
        [labels_2 autoAlignViewsToEdge:ALEdgeTop];
        [[labels_2 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:[labels_1 lastObject] withOffset:20];
        
        
        [[labels_2 firstObject]autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [[labels_2 lastObject] autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:[labels_2 firstObject] withOffset:-10];
        [[labels_2 lastObject]autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        NSArray *labels_3 = @[self.yellowLabel,self.yellowLabel_1];
        
        [labels_3 autoDistributeViewsAlongAxis:ALAxisVertical alignedTo:ALAttributeVertical withFixedSpacing:80];
        
        NSArray *labels_4 = @[self.purpleLabel,self.purpleLabel_1];
        
        [[labels_4 firstObject] autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [labels_4 autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:100.0 insetSpacing:NO matchedSizes:YES];
        
        NSArray *labels_5 = @[self.whiteLabel,self.whiteLabel_1];
        [[labels_5 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [labels_5 autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:50 insetSpacing:NO];
        
        NSArray *labels_6 = @[self.greenLabel,self.greenLabel_1];
        [[labels_6 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [labels_6 autoDistributeViewsAlongAxis:ALAxisVertical alignedTo:ALAttributeVertical withFixedSize:100];

    }
    
    [super updateConstraints];
}

@end
