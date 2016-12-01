//
//  ViewController.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/8.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "ViewController.h"
#import "PinContentView.h"
#import "AlignContentView.h"
#import "AnimationContentView.h"
#import "CustomizeContentView.h"
#import "AlignArrayContentView.h"

static const NSInteger HEIGHT = 100;
@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) AlignContentView *alignView;
@property (nonatomic, strong) PinContentView *pinView;
@property (nonatomic, strong) AlignArrayContentView *alignArrayView;
@property (nonatomic, strong) AnimationContentView *animationView;
@property (nonatomic, strong) CustomizeContentView *customizeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)loadView
{
    self.view = [UIView new];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.alignView];
    [self.contentView addSubview:self.pinView];
    [self.contentView addSubview:self.alignArrayView];
    [self.contentView addSubview:self.animationView];
    [self.contentView addSubview:self.customizeView];
    [self.view setNeedsUpdateConstraints]; // bootstrap Auto Layout
}
- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    self.alignView.title =@"view横向或竖向居中";
    self.pinView.title =@"view进行间隔布局";
    self.alignArrayView.title =@"view进行array布局";
    self.animationView.title =@"view使用动态布局进行animation";
    [self.animationView startAnimation];
    
    self.customizeView.title =@"view加载";

}
- (void)updateViewConstraints
{
    // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
    // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
    // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
    if (!self.didSetupConstraints) {
        
        [self.scrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        [self.contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        [self.contentView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view];
        
        
        [self.alignView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.alignView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.alignView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.alignView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.alignView];

        
        [self.pinView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.alignView withOffset:20];
        [self.pinView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.pinView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.pinView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.pinView];
        
        [self.alignArrayView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.pinView withOffset:20];
        [self.alignArrayView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.alignArrayView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.alignArrayView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.alignArrayView];
        
        [self.animationView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.alignArrayView withOffset:20];
        [self.animationView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.animationView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.animationView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.animationView];
        
        
        [self.customizeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.animationView withOffset:20];
        [self.customizeView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.customizeView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.customizeView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.customizeView];
        
        
        [self.customizeView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView newAutoLayoutView];
        _scrollView.backgroundColor = [UIColor lightGrayColor];
    }
    return _scrollView;
}
- (UIView *)contentView{

    if (!_contentView) {
        _contentView = [UIView newAutoLayoutView];
    }
    return _contentView;
}


- (CustomizeContentView *)customizeView{

    if (!_customizeView) {
        _customizeView = [CustomizeContentView newAutoLayoutView];
    }
    return _customizeView;
}
- (AnimationContentView *)animationView{

    if (!_animationView) {
        _animationView = [AnimationContentView newAutoLayoutView];
    }
    return _animationView;
}
- (AlignArrayContentView *)alignArrayView{

    if (!_alignArrayView) {
        _alignArrayView = [AlignArrayContentView newAutoLayoutView];
    }
    return _alignArrayView;
    
}
- (PinContentView *)pinView{

    if (!_pinView) {
        _pinView = [PinContentView newAutoLayoutView];
    }
    return _pinView;
}
- (AlignContentView *)alignView{

    if (!_alignView) {
        _alignView = [[AlignContentView alloc]init];

    }
    return  _alignView;
}
@end
