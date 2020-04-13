//
//  AlignContentVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/6.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "AlignContentVC.h"

@interface AlignContentVC ()

@end

@implementation AlignContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}

-(void)setupUI {
    
    for (NSInteger i = 0; i<30; i++){
        UIView *view = [UIView new];
        view.backgroundColor = UIColor.randomColor;
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(40);
            layout.height = YGPointValue(40);
        }];
    }
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.flexWrap = YGWrapWrap;
        layout.justifyContent = YGJustifyFlexStart;
        layout.alignItems = YGAlignFlexStart;
        
        /** YGAlign
        YGAlignAuto,        //自动, 跟不设置, 或设置成start 一样效果
        YGAlignFlexStart,   //默认, 与主轴方向有关, 侧轴整列/行的起点为 left 或 top
        YGAlignCenter,
        //与主轴方向有关, 侧轴列/行的起点为 垂直中线 或 水平中线, 注意: 如果Flex Item只有一根轴线（只有一行的Flex Itme），直接设置该属性不起作用, 要调整为 FlexWrap 为 Wrap,效果才显示出来：
         
        YGAlignFlexEnd,     //与主轴方向有关, 侧轴整列/行的起点为 right 或 bottom
        YGAlignStretch,     //与主轴方向有关, item在侧轴上尽量撑大到与container宽/高一致, 但是iOS上不生效(很奇怪)
        YGAlignBaseline,    //没看出跟start有什么区别
        
         YGAlignSpaceBetween,
         //alignItems为Center会把第二列/行撑出屏幕外...很奇怪, alignItems为Start/End时则正常的为item列/行 为两端分布
        
         YGAlignSpaceAround //效果同上, alignItems为Start/End时才正常地 等外边距分布
        */

        layout.alignContent = YGAlignSpaceAround;
        layout.paddingTop = YGPointValue(34);
//        layout.width = YGPointValue(self.view.bounds.size.width);
//        layout.height = YGPointValue(self.view.bounds.size.height);
    }];
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
    
}






@end
