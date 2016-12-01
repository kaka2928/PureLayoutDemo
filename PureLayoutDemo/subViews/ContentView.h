//
//  ContentView.h
//  PureLayoutDemo
//
//  Created by caochao on 16/11/24.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "BasicView.h"

@interface ContentView : BasicView
@property (nonatomic,retain) NSString *title;

- (UILabel *)colorView:(UIColor *)color andText:(NSString *)text;
@end
