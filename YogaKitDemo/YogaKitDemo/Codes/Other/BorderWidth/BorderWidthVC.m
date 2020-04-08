//
//  BorderWidthVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/8.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "BorderWidthVC.h"

@interface BorderWidthVC ()

@end

@implementation BorderWidthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}


-(void)setupUI {
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
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
        //layout.alignItems = YGAlignStretch;
        //layout.padding = YGPointValue(88);
        
        /** 意义:
        在flexbox布局推进的过程中有两种布局结构定义item大小
        这两种模型是box模型的演进遗物，必须要了解，否则后面有些会出现模棱两可的地方。
        //第一种是: content-box
        当 box-sizing 设为 content-box，指内部width和height框定的区域即是container/item的大小。
        //第二种是: border-box (Yoga 中默认是这种)
        当 box-siziong 设为 boder-box时，指含 border 以内的区域, 即: width和height框定的区域 加上 borderWidth的区域, 才构成container/item的大小。

        container.borderWidth默认是0.
        所以在container上调整borderWidth, 实际上会缩小container的Width/Height, 造成布局内缩(类似于padding效果).
        而在item上调整borderWidth, 如果borderWith加起来的大小超过你设置的layout.width 和 layout.heigth 框定的大小, 则item实际大小会被撑大.(因为在border-box布局中, 默认item的content面积是0, 在未计算过yoga布局之前使用borderWidth会与计算出的item的content大小比较)

        一般我们只要了解border属性即可, 开发中并不会使用borderWidth
         */
        
        layout.borderTopWidth = 100;
    }];
    
    YGLayoutConfigurationBlock block = ^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(100);
        
        //会看到如果borderWidth加起来的面积比设置的width + height框定面积大, 就会顶替
        layout.borderLeftWidth = 51;
        layout.borderRightWidth = 51;
        layout.borderTopWidth = 51;
        layout.borderBottomWidth = 51;
        
//        layout.borderRightWidth = 10;
    };
    
    [redView configureLayoutWithBlock:block];
    [yellowView configureLayoutWithBlock:block];
    [blueView configureLayoutWithBlock:block];
    
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    for (UIView *view in self.view.subviews) {
//        NSLog(@" frame == %@", NSStringFromCGRect(view.frame));
//    }
//    NSLog(@" frame == %@", NSStringFromCGRect(self.view.frame));
    
}



@end
