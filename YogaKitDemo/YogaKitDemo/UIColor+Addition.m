//
//  UIColor+Addition.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/5.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "UIColor+Addition.h"


@implementation UIColor (Addition)

+(UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}

@end
