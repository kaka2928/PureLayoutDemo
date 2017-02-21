//
//  UIView+Presentation.m
//  Components
//
//  Created by caochao on 16/12/19.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "UIView+Presentation.h"

@implementation UIView (Presentation)
#pragma mark - presention
- (void)presentSubView:(UIView *)subview
   originalConstraints:(NSArray <NSLayoutConstraint *>* (^)(void))originalConstraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
           complection:(void (^)(BOOL success))complection{
    
    
    NSTimeInterval animationDuration = (animated)?0.8:0;
    [self presentSubView:subview originalConstraints:originalConstraints targetValues:values isAnimated:animated
                isSpring:isSpring animationDuration:animationDuration complection:complection];
    
}


- (void)presentSubView:(UIView *)subview
    originalConstraint:(NSLayoutConstraint * (^)(void))originalConstraint
           targetValue:(CGFloat)value
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
           complection:(void (^)(BOOL success))complection{
    
    NSTimeInterval animationDuration = (animated)?0.8:0;
    [self presentSubView:subview originalConstraint:originalConstraint targetValue:value isAnimated:animated isSpring:isSpring animationDuration:animationDuration complection:complection];
}
- (void)presentSubView:(UIView *)subview
    originalConstraint:(NSLayoutConstraint * (^)(void))originalConstraints
           targetValue:(CGFloat)value
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
     animationDuration:(NSTimeInterval)animationDuration
           complection:(void (^)(BOOL success))complection{
    
    animationDuration = (animated)?animationDuration:0;
    if (![[self subviews] containsObject:subview]) {
        [self addSubview:subview];
        NSLayoutConstraint *targetConstraint = originalConstraints();
        [self layoutSubviews];
        
        if (isSpring) {
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
                                     if (complection) {
                                         complection(success);
                                     }
                                 }];
            }
        }else{
            [UIView animateWithDuration:animationDuration animations:^{
                targetConstraint.constant = value;
                [self layoutSubviews];
            } completion:^(BOOL finished) {
                BOOL success = [[self subviews] containsObject:subview];
                if (complection) {
                    complection(success);
                }
            }];
        }
    }
}
- (void)presentSubView:(UIView *)subview
   originalConstraints:(NSArray <NSLayoutConstraint *>* (^)(void))originalConstraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
     animationDuration:(NSTimeInterval)animationDuration
           complection:(void (^)(BOOL success))complection{
    
    animationDuration = (animated)?animationDuration:0;
    if (![[self subviews] containsObject:subview]) {
        [self addSubview:subview];
        NSArray *targetConstraints = originalConstraints();
        if ([targetConstraints count] != [values count]) {
            
            //@"目标constraint 与value 需要个数一致，否则会在下面引起崩溃"
            if (complection) {
                complection(NO);
                
            }
            return;
        }
        [self layoutSubviews];
        
        if (isSpring) {
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
                                     
                                     if (complection) {
                                         complection(success);
                                     }
                                 }];
            }

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
                if (complection) {
                    complection(success);
                }
            }];
            
        }
        
        
    }
}
#pragma mark - dismiss

// subview 移除以后需要把constraint deactivate掉，因为subview与superview之间的constraint会随着remove失效，但是自身的constraint即使被remove也是无法失效。
- (void)dismissSubView:(UIView *)subview
            constraint:(NSLayoutConstraint * )constraint
           targetValue:(CGFloat)value
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
           complection:(void (^)(BOOL success))complection{
    
    NSTimeInterval animationDuration = (animated)?0.8:0;
    [self dismissSubView:subview constraint:constraint targetValue:value isAnimated:animated isSpring:isSpring animationDuration:animationDuration complection:complection];
}
- (void)dismissSubView:(UIView *)subview
           constraints:(NSArray <NSLayoutConstraint *>*)constraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
           complection:(void (^)(BOOL success))complection{
    
    NSTimeInterval animationDuration = (animated)?0.8:0;
    [self dismissSubView:subview constraints:constraints targetValues:values isAnimated:animated isSpring:isSpring animationDuration:animationDuration complection:complection];
}
- (void)dismissSubView:(UIView *)subview
            constraint:(NSLayoutConstraint * )constraint
           targetValue:(CGFloat)value
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
     animationDuration:(NSTimeInterval)animationDuration
           complection:(void (^)(BOOL success))complection{
    animationDuration = (animated)?animationDuration:0;
    if ([[self subviews] containsObject:subview]) {
        
        if (isSpring) {
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
                                     if (complection) {
                                         complection(success);
                                     }
                                 }];
            }
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
                if (complection) {
                    complection(success);
                }
            }];
            
        }
        
        
    }
}

- (void)dismissSubView:(UIView *)subview
           constraints:(NSArray <NSLayoutConstraint *>*)constraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
     animationDuration:(NSTimeInterval)animationDuration
           complection:(void (^)(BOOL success))complection{
    
    if ([constraints count] != [values count]) {
        if (complection) {
            complection(NO);
            
        }
        return;
    }
    animationDuration = (animated)?animationDuration:0;
    if ([[self subviews] containsObject:subview]) {
        
        if (isSpring) {
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
                                     if (complection) {
                                         complection(success);
                                     }
                                 }];
            }
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
                if (complection) {
                    complection(success);
                }
            }];
            
        }
        
        
    }
}
@end
