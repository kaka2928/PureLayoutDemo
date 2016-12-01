//
//  BasicViewController.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/8.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)loadView
{
    self.view = [UIView new];

    
    [self.view setNeedsUpdateConstraints]; // bootstrap Auto Layout
}

- (void)updateViewConstraints
{
    // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
    // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
    // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
    if (!self.didSetupConstraints) {

        
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}
@end
