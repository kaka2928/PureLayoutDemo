//
//  ClassTest.m
//  PureLayoutDemo
//
//  Created by caochao on 16/11/7.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "ClassTest.h"

static BOOL ISDEBUG = NO;

@implementation ClassTest
+(void)startDebugMode:(BOOL)isDebug{

    ISDEBUG = isDebug;
}
+(void)test{

    NSLog(@"debug is %d",ISDEBUG);
}
@end
