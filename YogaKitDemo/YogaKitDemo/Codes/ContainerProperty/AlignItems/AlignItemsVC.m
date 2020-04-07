//
//  AlignItemsVC.m
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/6.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import "AlignItemsVC.h"

@interface AlignItemsVC ()

@property (nonatomic,strong) NSNumber *number;///<111

@end

@implementation AlignItemsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.number = [NSNumber numberWithInt:111];
    
//    [self setupUI];
//    [self testStretch];
    [self testSpaceBetweenAndSpaceAround];
}

#pragma mark - 验证YGAlignSpaceBetween 和 YGAlignSpaceAround
-(void)testSpaceBetweenAndSpaceAround {
    
    for (NSInteger i = 0; i<5; i++){
        UIView *view = [UIView new];
        view.backgroundColor = UIColor.randomColor;
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.height = YGPointValue(80);
            layout.width = YGPointValue(80);
        }];
    }
    
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.flexWrap = YGWrapNoWrap;
        layout.justifyContent = YGJustifySpaceBetween;
        
        /**
         alignItems属性很多表现是与container是否使用YGWrapWrap有很大关系的, 这个要注意.
         对于操作多行item的情况不建议使用此属性处理.
         
         YGAlignSpaceBetween, //即使对于单行item的情况,也总是让单行item排列贴边, 变成与YGAlignFlexEnd是一样的; 对于多行item, 则会让另外一行item被挤出container, 我没找到这个属性适用的场景, 很奇怪
         YGAlignSpaceAround  //同上
         
         
         */
        layout.alignItems = YGAlignSpaceBetween;
//        layout.alignContent = YGAlignCenter;
    }];
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}




#pragma mark - 单一验证YGAlignStretch
-(void)testStretch {
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.justifyContent = YGJustifyFlexStart;
        layout.paddingTop = YGPointValue(34);
        layout.paddingBottom = YGPointValue(44);
        layout.alignItems = YGAlignStretch; // alignItems=YGAlignAuto; 时, 若当前节点下的item在交叉轴上不设置 宽/高, 则会完全拉伸跟设置成YGAlignStretch是一样的
        
    }];
    
    
    for (NSInteger i = 0; i<3; i++){
        UIView *view = [UIView new];
        view.backgroundColor = UIColor.randomColor;
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
//            layout.width = YGPointValue(100);
//            if (i == 1) {
//                layout.alignSelf = YGAlignCenter;
//                layout.width = YGPointValue(100);
//            }
            layout.height = YGPointValue(88);
        }];
        
        
    }
    
    [self.view.yoga applyLayoutPreservingOrigin:YES];
    
}

-(void)dealloc {
    NSLog(@"dealloc.......");
}



-(void)setupUI {
    
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        //        layout.direction = YGDirectionLTR;
        layout.flexWrap = YGWrapWrap;
        layout.flexDirection =  YGFlexDirectionRow;
        
        /** YGAlign    item在交叉轴上的对齐方式,  交叉轴肯定与主轴垂直
         YGAlignAuto,       //自动, 意义不明,但是会明显让item尽量大
         
         YGAlignFlexStart,
         //跟主轴方向有关, item会以贴着某一个边对齐,如:垂直排列左边对齐
         
         YGAlignFlexEnd,
         //跟主轴方向有关, item会以贴着某一个边对齐,如:垂直排列右边对齐
         
         YGAlignCenter,
         //让所有item中线与交叉轴中线一致, 按主轴方向排列, 注意:如果使用YGWrapWrap, 则此属性不生效, item在交叉轴以YGAlignFlexStart方式排列
         
         YGAlignStretch,
         //跟主轴方向有关, 会让每个item在交叉轴上(宽/高)进行拉伸,拉伸到贴着containerd的宽/高, 注意: 使用此属性不能使用layout.flexWrap = YGWrapWrap;
         
         YGAlignBaseline,
         //所有item以item的首行的文字为基线对齐，仅在FlexDirection为 row / row-reverse 时生效, item是普通view的情况下设置此属性,会以底部对齐
         
         YGAlignSpaceBetween, //即使对于单行item的情况,也总是让单行item排列贴边, 变成与YGAlignFlexEnd是一样的; 对于多行item, 则会让另外一行item被挤出container, 我没找到这个属性适用的场景, 很奇怪
         YGAlignSpaceAround   //同上
         */
        layout.justifyContent = YGJustifyFlexStart;
        layout.alignItems = YGAlignFlexEnd;
        
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.height = YGPointValue(self.view.bounds.size.height);
        layout.paddingTop = YGPointValue(34);
    }];
    
    for (NSInteger i = 0; i<5; i++){
        UIView *view = [UIView new];
//        view.text = [NSString stringWithFormat:@"%zd",i];
        view.backgroundColor = UIColor.randomColor;
        [self.view addSubview:view];
        
        [view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(44);
//            layout.marginLeft = YGPointValue(10);
//            layout.height = YGValueAuto;
            layout.height = YGPointValue(60 + 5*i);
        }];
    }
    
//    [self.view.subviews[0].yoga markDirty];
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
    
}

@end
