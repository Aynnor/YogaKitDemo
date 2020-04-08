//
//  BasisVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/8.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "BasisVC.h"

@interface BasisVC ()

@end

@implementation BasisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}

-(void)setupUI {
    
    for (NSInteger i = 0; i<5; i++){
        UIView *view = [UIView new];
        view.backgroundColor = UIColor.randomColor;
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width = YGValueAuto;
            layout.height = YGPointValue(100);
            /** Basis总结:
             Basis只能设置当前Item在主轴方向上的属性width/height的大小
             优先级比width/height/Grow/Shrink高
             无论主轴方向上的width/height/Grow/Shrink是多少, 都不计算, 先计算设置了flexBasis 的 item, 然后才分配剩余空间
             
             */
            layout.flexBasis = YGPercentValue(20);
//            layout.flexBasis = YGPointValue(50);
        }];
    }
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.flexWrap = YGWrapWrap;
    }];
    
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for (UIView *v in self.view.subviews ) {
        NSLog(@"size = %@", NSStringFromCGSize(v.frame.size));
    }
    
}



@end
