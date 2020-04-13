//
//  FlexDirectionVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/5.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "FlexDirectionVC.h"


@interface FlexDirectionVC ()

@end

@implementation FlexDirectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self createUI];
}


-(void)createUI {
    

    //container 元素
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        
        /**YGFlexDirection有4种
        YGFlexDirectionColumn,        //列 - 即垂直方向, 从上 -> 下 (默认)
        YGFlexDirectionColumnReverse, //列颠倒 - 即垂直方向, 从 下 -> 上
        YGFlexDirectionRow,           //行 - 即水平方向, 从 左 -> 右
        YGFlexDirectionRowReverse     //行颠倒 - 即水平方向, 从 右 -> 左
        */
        layout.flexDirection = YGFlexDirectionRow; //主轴方向 左 -> 右
        
        layout.flexWrap = YGWrapWrap;//换行? 默认是No
//        layout.justifyContent = YGJustifyFlexStart; //整列or整行 排布方式
        layout.paddingTop = YGPointValue(34);//排列时内边距
    }];
    
    
    for (NSInteger i = 0; i<30; i++){
        UIView *view = [UIView new];
        view.backgroundColor = UIColor.randomColor;
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(40 + i*2);
            layout.height = YGPointValue(30 + i*2);
//            layout.marginLeft = YGPointValue(15);
        }];
    }

    
    //使用原点布局?
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}




@end
