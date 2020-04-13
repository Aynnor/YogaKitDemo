//
//  ShrinkVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/8.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "ShrinkVC.h"

@interface ShrinkVC ()

@end

@implementation ShrinkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}

-(void)setupUI {
    
    NSLog(@"default FlexShrink = %lf", self.view.yoga.flexShrink);
    
    NSString *str = [NSMutableString stringWithString:@"巴拉巴拉啦巴拉"];
    for (NSInteger i = 0; i<5; i++){
        str = [str stringByAppendingString:str];
        UILabel *view = [UILabel new];
        view.text = str;
//        view.text = [NSString stringWithFormat:@"%zd -- 巴拉巴拉啦巴拉巴拉啦巴拉巴拉啦罢了",i];
        view.backgroundColor = UIColor.randomColor;
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
//            layout.width = YGPointValue(100*(i + 1));
            layout.height = YGPointValue(44);
//            layout.marginLeft = YGPointValue(10);
            
            /** FlexShrink 总结:
             item.flexShrink 默认为0, 表示不收缩
             flexShrink只会在当前行的item都已经放不下item的总宽/高 的时候才会按Shrink比例收缩item
             
             情况1: 若当前container为YGWrapNoWrap, 当前行所有item的Shrink是一致的(非零), 则会按当container行宽度根据当前item.layout.width和shrink来按比例收缩.
             若没有设置layout.width, 则该行上的item会等分该行宽度, 与item的固有frame.size无关(比如:label)
                    
             情况2: 若当前container为YGWrapNoWrap, 但是只有部分item有设置shrink, 若当不设置shrink的item的总width没有超过container的宽度, 则剩余空间按shrink比例收缩item.
             若已经超出container宽度, 则超出屏幕范围外的item如果是有设置shrink的, 则这些item 的 width会变成0.
             
             
             情况3: 若当前container为YGWrapWrap, 则换行会按照当前行的item.layout.width和shrink比例来收缩item.
             若没有设置layout.width, 则该行上的imte会等分该行宽度, 与与item的固有frame大小无关(比如:label).
             但注意: 在没有设置layout.width的情况下, 换行是根据item的固有frame.size来换行的.
             */
//            if (i>3) {
//                layout.flexShrink = 1;
//            }
            layout.flexShrink = 1;
        }];
    }
    
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.flexWrap = YGWrapWrap;
        layout.justifyContent = YGJustifyFlexStart;
        layout.alignItems = YGAlignFlexStart;
        layout.paddingTop = YGPointValue(34);
    }];
    
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    NSLog(@"ScreenWidth = %lf", self.view.bounds.size.width);
    //414
    
    NSLog(@"FirstView size = %@", NSStringFromCGSize(self.view.subviews[1].frame.size));
    //{83, 100}
    
//    for (UIView *v in self.view.subviews) {
//        NSLog(@"FirstView size = %@", NSStringFromCGSize(v.frame.size));
//    }
    
    

    NSLog(@"LastView size = %@", NSStringFromCGSize(self.view.subviews.lastObject.frame.size));
    //{83, 100}

}




@end
