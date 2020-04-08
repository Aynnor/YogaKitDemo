//
//  PaddingVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/8.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "PaddingVC.h"

@interface PaddingVC ()

@end

@implementation PaddingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}


-(void)setupUI {
    
    UIView *redView = [UIView new];
    redView.backgroundColor = UIColor.redColor;
    [self.view addSubview:redView];
    
    UIView *yellowView = [UIView new];
    yellowView.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:yellowView];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:blueView];
    
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.alignItems = YGAlignStretch;
        
        layout.padding = YGPointValue(88);
        
        /** padding属性总结:
         padding相当于是给当前节点container设置内边距, 只用于收缩container, 无法扩张变大
         padding属性是用于给container节点使用的, 不是给item使用的
         
         注意: paddingStart 和 paddingEnd 只作用于水平轴方向收缩, 不受主轴方向影响
         */
        
    }];
    
    YGLayoutConfigurationBlock block = ^(YGLayout *layout) {
        layout.isEnabled = YES;
//        layout.width = YGPointValue(100);
//        layout.height = YGPointValue(100);
        layout.flexGrow = 1;
    };
    
    [redView configureLayoutWithBlock:block];
    [yellowView configureLayoutWithBlock:block];
    [blueView configureLayoutWithBlock:block];
    
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"zzz - %d", self.view.yoga.paddingStart.unit);
}









@end
