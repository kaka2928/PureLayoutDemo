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
#pragma mark - API
#pragma mark - presention
- (void)presentSubView:(UIView *)subview
   originalConstraints:(NSArray <NSLayoutConstraint *>* (^)(void))originalConstraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
            comlection:(void (^)(BOOL success))comlection{


    NSTimeInterval animationDuration = (animated)?0.8:0;
    [self presentSubView:subview originalConstraints:originalConstraints targetValues:values isAnimated:animated animationDuration:animationDuration comlection:comlection];

}


- (void)presentSubView:(UIView *)subview
   originalConstraints:(NSLayoutConstraint * (^)(void))originalConstraints
           targetValue:(CGFloat)value isAnimated:(BOOL)animated
            comlection:(void (^)(BOOL success))comlection{
    _NSConcreteStackBlock
    NSTimeInterval animationDuration = (animated)?0.8:0;
    [self presentSubView:subview originalConstraints:originalConstraints targetValue:value isAnimated:animated animationDuration:animationDuration comlection:comlection];
}
- (void)presentSubView:(UIView *)subview
   originalConstraints:(NSLayoutConstraint * (^)(void))originalConstraints
           targetValue:(CGFloat)value isAnimated:(BOOL)animated
     animationDuration:(NSTimeInterval)animationDuration
            comlection:(void (^)(BOOL success))comlection{

    animationDuration = (animated)?animationDuration:0;
    if (![[self subviews] containsObject:subview]) {
        [self addSubview:subview];
        NSLayoutConstraint *targetConstraint = originalConstraints();
        
        [self layoutSubviews];
        
        if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_0) {
            [UIView animateWithDuration:animationDuration
                                  delay:0.0
                 usingSpringWithDamping:0.6
                  initialSpringVelocity:0
                                options:0
                             animations:^{
                                 targetConstraint.constant = value;
                                 [self layoutSubviews];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                                 BOOL success = [[self subviews] containsObject:subview];
                                 if (comlection) {
                                     comlection(success);
                                 }
                             }];
        }else{
            [UIView animateWithDuration:animationDuration animations:^{
                targetConstraint.constant = value;
                [self layoutSubviews];
            } completion:^(BOOL finished) {
                BOOL success = [[self subviews] containsObject:subview];
                if (comlection) {
                    comlection(success);
                }
            }];
        }
    }
}
- (void)presentSubView:(UIView *)subview
   originalConstraints:(NSArray <NSLayoutConstraint *>* (^)(void))originalConstraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
     animationDuration:(NSTimeInterval)animationDuration
            comlection:(void (^)(BOOL success))comlection{
    
    animationDuration = (animated)?animationDuration:0;
    if (![[self subviews] containsObject:subview]) {
        [self addSubview:subview];
        NSArray *targetConstraints = originalConstraints();
        if ([targetConstraints count] != [values count]) {
            
            //@"目标constraint 与value 需要个数一致，否则会在下面引起崩溃"
            if (comlection) {
                comlection(NO);
                
            }
            return;
        }
        [self layoutSubviews];
        
        if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_0) {
            [UIView animateWithDuration:animationDuration
                                  delay:0.0
                 usingSpringWithDamping:0.6
                  initialSpringVelocity:0
                                options:0
                             animations:^{
                                 for (int i=0; i<[targetConstraints count]; i++) {
                                     CGFloat value = [[values objectAtIndex:i] floatValue];
                                     NSLayoutConstraint *targetConstraint = [targetConstraints objectAtIndex:i];
                                     targetConstraint.constant = value;
                                 }
                                 
                                 [self layoutSubviews];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                                 BOOL success = [[self subviews] containsObject:subview];
                                 
                                 if (comlection) {
                                     comlection(success);
                                 }
                             }];
        }else{
            [UIView animateWithDuration:animationDuration animations:^{
                for (int i=0; i<[targetConstraints count]; i++) {
                    CGFloat value = [[values objectAtIndex:i] floatValue];
                    NSLayoutConstraint *targetConstraint = [targetConstraints objectAtIndex:i];
                    targetConstraint.constant = value;
                }
                [self layoutSubviews];
            } completion:^(BOOL finished) {
                BOOL success = [[self subviews] containsObject:subview];
                if (comlection) {
                    comlection(success);
                }
            }];
            
        }
        
        
    }
}
#pragma mark - dismiss

// subview 移除以后需要把constraint deactivate掉，因为subview与superview之间的constraint会随着remove失效，但是自身的constraint即使被remove也是无法失效。
- (void)dismissSubView:(UIView *)subview
            constraint:(NSLayoutConstraint * )constraint
           targetValue:(CGFloat)value isAnimated:(BOOL)animated
            comlection:(void (^)(BOOL success))comlection{

    NSTimeInterval animationDuration = (animated)?0.8:0;
    [self dismissSubView:subview constraint:constraint targetValue:value isAnimated:animated animationDuration:animationDuration comlection:comlection];
}
- (void)dismissSubView:(UIView *)subview
           constraints:(NSArray <NSLayoutConstraint *>*)constraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
            comlection:(void (^)(BOOL success))comlection{
    
   NSTimeInterval animationDuration = (animated)?0.8:0;
    [self dismissSubView:subview constraints:constraints targetValues:values isAnimated:animated animationDuration:animationDuration comlection:comlection];
}
- (void)dismissSubView:(UIView *)subview
            constraint:(NSLayoutConstraint * )constraint
           targetValue:(CGFloat)value isAnimated:(BOOL)animated
     animationDuration:(NSTimeInterval)animationDuration
            comlection:(void (^)(BOOL success))comlection{
    animationDuration = (animated)?animationDuration:0;
    if ([[self subviews] containsObject:subview]) {
        
        if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_0) {
            
            [UIView animateWithDuration:animationDuration
                                  delay:0.0
                 usingSpringWithDamping:0.6
                  initialSpringVelocity:0
                                options:0
                             animations:^{
                                 constraint.constant = value;
                                 [self layoutSubviews];
                                 
                             }
                             completion:^(BOOL finished) {
                                 if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0) {
                                     [NSLayoutConstraint deactivateConstraints:@[constraint]];
                                 }
                                 [subview removeFromSuperview];
                                 BOOL success = ![[self subviews] containsObject:subview];
                                 if (comlection) {
                                     comlection(success);
                                 }
                             }];
        }else{
            [UIView animateWithDuration:animationDuration animations:^{
                constraint.constant = value;
                [self layoutSubviews];
            } completion:^(BOOL finished) {
                if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0) {
                    [NSLayoutConstraint deactivateConstraints:@[constraint]];
                }
                [subview removeFromSuperview];
                BOOL success = ![[self subviews] containsObject:subview];
                if (comlection) {
                    comlection(success);
                }
            }];
            
        }
        
        
    }
}

- (void)dismissSubView:(UIView *)subview
           constraints:(NSArray <NSLayoutConstraint *>*)constraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
     animationDuration:(NSTimeInterval)animationDuration
            comlection:(void (^)(BOOL success))comlection{

    if ([constraints count] != [values count]) {
        if (comlection) {
            comlection(NO);
            
        }
        return;
    }
    animationDuration = (animated)?animationDuration:0;
    if ([[self subviews] containsObject:subview]) {
        
        if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_0) {
            
            [UIView animateWithDuration:animationDuration
                                  delay:0.0
                 usingSpringWithDamping:0.6
                  initialSpringVelocity:0
                                options:0
                             animations:^{
                                 for (int i=0; i<[constraints count]; i++) {
                                     CGFloat value = [[values objectAtIndex:i] floatValue];
                                     NSLayoutConstraint *targetConstraint = [constraints objectAtIndex:i];
                                     targetConstraint.constant = value;
                                 }
                                 [self layoutSubviews];
                                 
                             }
                             completion:^(BOOL finished) {
                                 if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0) {
                                     [NSLayoutConstraint deactivateConstraints:constraints];
                                 }
                                 [subview removeFromSuperview];
                                 BOOL success = ![[self subviews] containsObject:subview];
                                 if (comlection) {
                                     comlection(success);
                                 }
                             }];
        }else{
            [UIView animateWithDuration:animationDuration animations:^{
                for (int i=0; i<[constraints count]; i++) {
                    CGFloat value = [[values objectAtIndex:i] floatValue];
                    NSLayoutConstraint *targetConstraint = [constraints objectAtIndex:i];
                    targetConstraint.constant = value;
                }
                [self layoutSubviews];
            } completion:^(BOOL finished) {
                if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0) {
                    [NSLayoutConstraint deactivateConstraints:constraints];
                }
                [subview removeFromSuperview];
                BOOL success = ![[self subviews] containsObject:subview];
                if (comlection) {
                    comlection(success);
                }
            }];
            
        }
        
        
    }
}
@end
