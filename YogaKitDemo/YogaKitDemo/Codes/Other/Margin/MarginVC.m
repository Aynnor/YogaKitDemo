//
//  MarginVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/8.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "MarginVC.h"

@interface MarginVC ()

@end

@implementation MarginVC

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
        layout.flexWrap = YGWrapWrap;
        layout.justifyContent = YGJustifyFlexStart;
//        layout.marginTop = YGPointValue(44);
    }];
    
    [redView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
        layout.margin = YGPointValue(44);
//        layout.marginVertical = YGPointValue(50);
        
#pragma mark - 总结:
        /** margin属性总结:
         margin相当于为item增加外边距, 会让item自身产生偏移, 并且会影响到整个container的items的布局产生偏移.
         
         设置值的正负, 就能让偏移方向改变
         
        值得注意的是: marginStart 和 marginEnd 无论在什么情况下, 都只会让item在水平方向上偏移, 该偏移不受主轴方向影响.
         
        如果只想改动一处就让container内其他item产生同样的偏移, 这个属性就非常好用
         
         */
    }];
    
    [yellowView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
    }];
    [blueView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
    }];
    
    for (NSInteger i = 0; i<10; i++){
        UIView *view = [UIView new];
        view.backgroundColor = UIColor.randomColor;
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(100);
            layout.height = YGPointValue(100);
        }];
    }
    
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

@end
