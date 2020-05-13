# YogaKitDemo
This is FaceBook layout Framework YogaKit test demo.


源码地址 --> ![Framework Source Code](https://github.com/facebook/yoga/tree/master/YogaKit) YogaKit Layout
</br>
FlexBox布局原理参考 --> ![Reference](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)
</br>


### Instructions

```bash

#CocoaPods导入
#必须开启使用静态库选项
use_frameworks!

#pod YogaKit
pod 'YogaKit'

```


### Method Description
```Swift

1.导入此头文件
#import <YogaKit/UIView+Yoga.h>  
//此头文件包含了#import <YGLayout.h>, 包含了所有布局属性


2.属性和方法

//这个属性是读取view的YGLayout布局属性的, 只读
@property (nonatomic, readonly, strong) YGLayout *yoga;

//获取view是否开启了Yoga布局, 只读
@property (nonatomic, readonly, assign) BOOL isYogaEnabled;

//返回yoga约束计算后的size, 如果没给定yoga约束,则直接返回view当前的size
@property (nonatomic, readonly, assign) CGSize intrinsicSize;

//返回正在使用Flexbox的子级数目。
@property (nonatomic, readonly, assign) NSUInteger numberOfChildren;

//当前叶视图是否有使用yoga布局?
@property (nonatomic, readonly, assign) BOOL isLeaf;


//在此方法内设置各种布局属性的各种布局方式和属性
- (void)configureLayoutWithBlock:(YGLayoutConfigurationBlock)block
    NS_SWIFT_NAME(configureLayout(block:));


//执行yoga布局, 是否应用当前view的原点计算? 如果不使用当前原点,则计算从{0,0}开始
- (void)applyLayoutPreservingOrigin:(BOOL)preserveOrigin
    NS_SWIFT_NAME(applyLayout(preservingOrigin:));


//执行yoga布局, 是否应用当前view的原点计算? 如果不使用当前原点,则计算从{0,0}开始
//并使用灵活的 width / height 尺寸
- (void)applyLayoutPreservingOrigin:(BOOL)preserveOrigin
               dimensionFlexibility:(YGDimensionFlexibility)dimensionFlexibility
    NS_SWIFT_NAME(applyLayout(preservingOrigin:dimensionFlexibility:));

//枚举 YGDimensionFlexibility
YGDimensionFlexibilityFlexibleWidth,  //灵活的(可变动的)width
YGDimensionFlexibilityFlexibleHeight  //灵活的(灵活的可变动的)height



//根据给定的size计算yoga约束之后的size返回
- (CGSize)calculateLayoutWithSize:(CGSize)size
    NS_SWIFT_NAME(calculateLayout(with:));


//标记需要重新计算视图的布局。仅适用于叶视图   (只适用于item)
- (void)markDirty;



```

### 关于YGValue的说明
```Swift
0. YGValue的定义

#define YGUndefined NAN
//NAN为 uint32 的最大值, 即: 2143289344
所以: YGUndefined == 2143289344

typedef struct YGValue {
  float value;
  YGUnit unit;
} YGValue;

extern const YGValue YGValueAuto;       //YGValueAuto = {YGUndefined, YGUnitAuto}
extern const YGValue YGValueUndefined;  //YGValueUndefined = {YGUndefined, YGUnitUndefined};
extern const YGValue YGValueZero;       //YGValueZero = {0, YGUnitPoint};



//YGPointValue
YGValue YGPointValue(CGFloat value)
{
  return (YGValue) { .value = value, .unit = YGUnitPoint };
}

//YGPercentValue
YGValue YGPercentValue(CGFloat value)
{
  return (YGValue) { .value = value, .unit = YGUnitPercent };
}

"总结:"
总的来说YGValue是有2种类型的, 凡是可以使用YGValue来设置属性的值都支持这两种值的设置

//第一种:
YGPointValue是一个准确的值, 描述的是占据多少个pt, 这是一个准确大小, 1pt就是屏幕上的0.35146毫米

//第二种:
YGPercentValue描述的是百分比, 最低是YGPercentValue(0), 占当前轴宽/高的0%, 
最高没有上限,你可以设置为YGPercentValue(1000), 为当前轴宽/高的1000%

YGValueAuto --> 
YGValueUndefined --> 使用会导致crash, 不能主动使用这个值



//>>>>>>>>>>>>>>>>>>>>>>>>>>>> 下面是例子 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//例如:
layout.width = YGPointValue(50);
布局后此item会得到50pt的准确宽度.

layout.width = YGPercentValue(50);
布局后此item会得到当前width轴向的container轴宽的50%的宽度, 这是个相对值不是确定值.

```



