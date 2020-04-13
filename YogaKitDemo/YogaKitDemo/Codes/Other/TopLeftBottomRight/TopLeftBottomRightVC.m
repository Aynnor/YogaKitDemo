//
//  TopLeftBottomRightVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/8.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "TopLeftBottomRightVC.h"

@interface TopLeftBottomRightVC ()

@end

@implementation TopLeftBottomRightVC

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
        layout.paddingTop = YGPointValue(44);
        layout.flexDirection = YGFlexDirectionRow;
        layout.justifyContent = YGJustifyFlexStart;
        layout.alignItems = YGAlignCenter;
//        layout.left = YGPointValue(50);
//        layout.flexWrap = YGWrapWrap;
    }];
//    self.view.clipsToBounds = YES;
    
    [redView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
    }];
    
    [yellowView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
        layout.start = YGPointValue(50);
//        layout.right = YGPointValue(50);
    }];
    
    [blueView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
//        layout.top = YGPointValue(50);
//        layout.start = YGPointValue(50);
    }];
    
    
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UIView *view in self.view.subviews) {
        NSLog(@"size = %@", NSStringFromCGRect(view.frame));
    }
    
    /*
     情况1: YGFlexDirectionColumn | YGJustifyFlexStart | YGWrapNoWrap 情况下
     {{0, 44}, {100, 100}}
     {{0, 154}, {100, 100}}
     //layout.top = YGPointValue(10); 黄色view.y值下移了10
     
     {{0, 44}, {100, 100}}
     {{0, 134}, {100, 100}}
     //layout.top = YGPointValue(-10); 黄色view.y值上移了10
     
     情况2: YGFlexDirectionColumnReverse | YGJustifyFlexStart | YGWrapNoWrap 情况下
     {{0, 796}, {100, 100}}
     {{0, 676}, {100, 100}}
     //layout.top = YGPointValue(20); 黄色view上移了20;
     
     {{0, 796}, {100, 100}}
     {{0, 716}, {100, 100}}
     //layout.top = YGPointValue(-20); 黄色view下移了20;
     
     情况3: YGFlexDirectionColumnReverse | YGJustifyFlexStart | YGWrapWrap 情况下
     {{0, 44}, {100, 100}}
     {{0, 144}, {100, 100}}
     {{0, 294}, {100, 100}}
     //layout.right = YGPointValue(50); 黄色view无变化, 但是蓝色view.y下移了50
     
     
     总结:
     1. 在YGWrapNoWrap, 即单行item的情况下, item设置top/left/bottom/right/start/end都是生效的.
        会让item在本来布局属性完成的位置偏移, 并且这种偏移是不影响别的item排布的, 只与自身有关.
        start和end永远只影响item在水平方向轴上的偏移, 不受当前container主轴方向影响
     
     2. 在YGWrapWrap, 即设置可换行之后, item设置top/left/bottom/right只有跟主轴方向一致的属性才会生效.
     而start/end怎么设置都不生效.
     比如: 换行情况下的YGFlexDirectionColumn, 会生效的只有top和bottom属性.
     会让item在本来布局属性完成的位置偏移, 并且这种偏移是不影响别的item排布的, 只与自身有关.
     */
    
}


@end
