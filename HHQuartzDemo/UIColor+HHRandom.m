//
//  UIColor+HHRandom.m
//  HHQuartzDemo
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIColor+HHRandom.h"

@implementation UIColor (HHRandom)

+ (UIColor *)randomColor {
    static BOOL seeded = NO;
    
    if (!seeded) {
        seeded = YES;
        srandom(time(NULL));
    }
    CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;

    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

@end
