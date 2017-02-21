//
//  BasicView.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/8.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "BasicView.h"

@implementation BasicView

- (instancetype)init{
    
    if (self = [super init]) {

        [self setupSubViews];
    }
    
    return self;
}
#pragma mark - Setup

- (void)setupSubViews{

//    [self setNeedsUpdateConstraints];
//    [self updateConstraintsIfNeeded];
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

@end
