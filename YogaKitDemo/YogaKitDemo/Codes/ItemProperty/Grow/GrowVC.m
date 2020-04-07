//
//  GrowVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/7.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "GrowVC.h"

@interface GrowVC ()

@end

@implementation GrowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}

-(void)setupUI {
    
    NSLog(@" default flexGrow = %lf", self.view.yoga.flexGrow);
    
    for (NSInteger i = 0; i<5; i++){
        UIView *view = nil;
        if (i<2) {
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 0)];
        }else{
            view = [UIView new];
        }
        
        view.backgroundColor = [UIColor randomColor];
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.height = YGPointValue(100);
            
            if (i < 2) {
                layout.width = YGPointValue(220);
            }
            //layout.flexGrow = i;
            layout.flexGrow = 1;
            
            /** flexGrow总结:
             item.flexGrow 默认为0, 表示主轴方向上不扩张拉伸
             
             情况1: 当前Container下所有item的 layout.width 未设置时, view本来的frame.width不影响grow分配, 此时所有item会根据grow比例划分主轴上的空间
          
             情况2: 当前Container下item的yoga layout.width 设置有值时, 则会先用主轴宽减去item.layout.width, 剩下的空间才按grow比例分配, 当然你可以不设置已经分配了layout.width的item的grow,则不会分配剩余空间给此item
             
             情况3: 若当前container设置了Wrap, 则会正常换行, 然后每行的item会根据当前行的item的grow比例分配这个行的剩余空间
             
            */
            
        }];
    }
    
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.flexWrap = YGWrapWrap;
        layout.justifyContent = YGJustifySpaceBetween;
        layout.paddingTop = YGPointValue(34);
    }];
    
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"ScreenWidth = %lf", self.view.bounds.size.width);
    //414
    
    NSLog(@"FirstView size = %@", NSStringFromCGSize(self.view.subviews.firstObject.frame.size));
    //{143, 100}
    
    NSLog(@"LastView size = %@", NSStringFromCGSize(self.view.subviews.lastObject.frame.size));
    //{43, 100}
}


@end
