//
//  JustifyContentVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/6.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "JustifyContentVC.h"

@interface JustifyContentVC ()

@end

@implementation JustifyContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}


-(void)setupUI {
    
        //container 元素
        [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            
            layout.flexWrap = YGWrapWrap;//换行? 默认是No
            
            /** YGJustify
            YGJustifyFlexStart,     //起点排列: item从起点开始紧贴着排列
            YGJustifyCenter,        //中点排列: item贴紧, item排列好的中间点 对齐 主轴中间点, 从中点向两边散开
            YGJustifyFlexEnd,       //末点排列: item从末点开始紧贴着排列
            YGJustifySpaceBetween,  //两端对齐: 2个item贴着边界, 中间的item等间距布局
            YGJustifySpaceAround,   //外边距相等排列: item都有外边距, item与item之间为2外边距间隔, item与两边界是1外边距间隔
            YGJustifySpaceEvenly    //平均分布排列: item 与 item 与 两边界 的间隔都是等分的
            */
            layout.justifyContent = YGJustifyFlexStart; //整列or整行 排布方式
            layout.paddingTop = YGPointValue(34);//排列时内边距
        }];
        
        
        for (NSInteger i = 0; i<10; i++){
            UIView *view = [UIView new];
            view.backgroundColor = UIColor.randomColor;
            [self.view addSubview:view];
            
            [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
                layout.isEnabled = YES;
                layout.width = YGPointValue(60);
                layout.height = YGPointValue(60);
//                layout.marginLeft = YGPointValue(15);
            }];
        }

        
        //使用原点布局?
        [self.view.yoga applyLayoutPreservingOrigin:NO];
    
}




@end
