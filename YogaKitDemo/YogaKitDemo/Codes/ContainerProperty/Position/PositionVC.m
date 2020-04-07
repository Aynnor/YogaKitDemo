//
//  PositionVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/6.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "PositionVC.h"

@interface PositionVC ()

@end

@implementation PositionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}

-(void)setupUI {

    UIView *blueView = [UIView new];
    blueView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:blueView];
    
    [blueView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1;
        layout.height = YGPointValue(200);
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.justifyContent = YGJustifyFlexStart;
        layout.marginTop = YGPointValue(188);
        layout.alignItems = YGAlignFlexStart;
        
        layout.flexWrap = YGWrapWrap;
        layout.alignContent = YGAlignCenter;
    }];
    
    
    UIView *yellowView = [UIView new];
    yellowView.backgroundColor = UIColor.yellowColor;
    [blueView addSubview:yellowView];
    
    [yellowView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
        layout.marginTop = YGPointValue(-50);
//        layout.position = YGPositionTypeAbsolute;
    }];
    
    UILabel *label = [UILabel new];
    label.text = @"text1111....";
    label.font = [UIFont systemFontOfSize:15];
//    [label sizeToFit];
    [blueView addSubview:label];
    
    [label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(12);
        layout.maxWidth = YGPointValue(100);
//        layout.position = YGPositionTypeAbsolute;
    }];
    
    UILabel *label2 = [UILabel new];
    label2.text = @"22222222....3333333333333333333";
    label2.numberOfLines = 0;
    label2.font = [UIFont systemFontOfSize:15];
    [blueView addSubview:label2];
    [label2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(12);
        layout.maxWidth = YGPointValue(100);
//        layout.position = YGPositionTypeAbsolute;
    }];
    

    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.justifyContent = YGJustifyFlexStart;
        
        layout.alignItems = YGAlignFlexStart;
//        layout.paddingTop = YGPointValue(34);

        /** YGPositionType
         YGPositionTypeRelative, 相对的, 比较的
         YGPositionTypeAbsolute  绝对的, 完全的
         
         */
//        layout.position = YGPositionTypeAbsolute;
    }];
    
    
    [self.view.yoga applyLayoutPreservingOrigin:YES];
    
    
    
}

@end
