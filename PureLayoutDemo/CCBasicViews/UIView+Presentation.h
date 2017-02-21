//
//  UIView+Presentation.h
//  Components
//
//  Created by caochao on 16/12/19.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Presentation)
#pragma mark - presention

/**
 子view加载
 
 @param subview 子view
 @param originalConstraint 子view初始化constraint，block返回目标改变的constraint
 @param value 目标constraint 的目标值
 @param animated 是否动画
 @param isSpring 是否使用弹簧动画，iOS7.0以上
 @param animationDuration 动画时间，动画时间默认0.8
 @param complection 加载完成的block回调
 */
- (void)presentSubView:(UIView *)subview
    originalConstraint:(NSLayoutConstraint * (^)(void))originalConstraint
           targetValue:(CGFloat)value
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
     animationDuration:(NSTimeInterval)animationDuration
           complection:(void (^)(BOOL success))complection;
/**
 子view加载
 
 @param subview 子view
 @param originalConstraints 子view初始化constraints，block返回目标改变的一组constraint
 @param values 一组目标constraints 的目标值
 @param animated 是否动画
 @param isSpring 是否使用弹簧动画，iOS7.0以上
 @param animationDuration 动画时间，动画时间默认0.8
 @param complection 加载完成的block回调
 */
- (void)presentSubView:(UIView *)subview
   originalConstraints:(NSArray <NSLayoutConstraint *>* (^)(void))originalConstraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
     animationDuration:(NSTimeInterval)animationDuration
           complection:(void (^)(BOOL success))complection;
#pragma mark -auto animation
/**
 子view加载，动画时间默认0.8
 
 @param subview 子view
 @param originalConstraints 子view初始化constraints，block返回目标改变的constraint
 @param value 目标constraint 的目标值
 @param animated 是否动画
 @param isSpring 是否使用弹簧动画，iOS7.0以上
 @param complection 加载完成的block回调
 */
- (void)presentSubView:(UIView *)subview
    originalConstraint:(NSLayoutConstraint * (^)(void))originalConstraint
           targetValue:(CGFloat)value
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
           complection:(void (^)(BOOL success))complection;

/**
 子view加载，动画时间默认0.8
 
 @param subview 子view
 @param originalConstraints 子view初始化constraints，block返回目标改变的一组constraint
 @param values 一组目标constraints 的目标值
 @param animated 是否动画
 @param isSpring 是否使用弹簧动画，iOS7.0以上
 @param complection 加载完成的block回调
 */
- (void)presentSubView:(UIView *)subview
   originalConstraints:(NSArray <NSLayoutConstraint *>* (^)(void))originalConstraint
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
           complection:(void (^)(BOOL success))complection;

#pragma mark - dismiss

/**
 子view删除
 
 @param subview 子view
 @param constraint 目标constraint
 @param value 目标值
 @param animated 是否动画
 @param isSpring 是否使用弹簧动画，iOS7.0以上
 @param animationDuration 动画时间,动画时间默认0.8
 @param complection 删除完成的block回调
 */
- (void)dismissSubView:(UIView *)subview
            constraint:(NSLayoutConstraint * )constraint
           targetValue:(CGFloat)value
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
     animationDuration:(NSTimeInterval)animationDuration
           complection:(void (^)(BOOL success))complection;

/**
 子view删除
 
 @param subview subview 子view
 @param constraints 目标改变的一组constraint
 @param values 一组目标constraints 的目标值
 @param animated 是否动画
 @param isSpring 是否使用弹簧动画，iOS7.0以上
 @param animationDuration 动画时间，动画时间默认0.8
 @param complection 删除完成的block回调
 */
- (void)dismissSubView:(UIView *)subview
           constraints:(NSArray <NSLayoutConstraint *>*)constraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
     animationDuration:(NSTimeInterval)animationDuration
           complection:(void (^)(BOOL success))complection;
#pragma mark -auto animation
/**
 子view删除，动画时间默认0.8
 
 @param subview 子view
 @param constraint 目标constraint
 @param value 目标值
 @param animated 是否动画
 @param isSpring 是否使用弹簧动画，iOS7.0以上
 @param complection 删除完成的block回调
 */
- (void)dismissSubView:(UIView *)subview
            constraint:(NSLayoutConstraint * )constraint
           targetValue:(CGFloat)value
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
           complection:(void (^)(BOOL success))complection;

/**
 子view删除，动画时间默认0.8
 
 @param subview subview 子view
 @param constraints 目标改变的一组constraint
 @param values 一组目标constraints 的目标值
 @param animated 是否动画
 @param isSpring 是否使用弹簧动画，iOS7.0以上
 @param complection 删除完成的block回调
 */
- (void)dismissSubView:(UIView *)subview
           constraints:(NSArray <NSLayoutConstraint *>*)constraints
          targetValues:(NSArray <NSNumber *>*)values
            isAnimated:(BOOL)animated
              isSpring:(BOOL)isSpring
           complection:(void (^)(BOOL success))complection;
@end
