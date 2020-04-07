# YogaKitDemo
This is FaceBook layout Framework YogaKit test demo.


![Framework Source Code](https://github.com/facebook/yoga/tree/master/YogaKit) YogaKit Layout
</br>
![Reference](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)
</br>


### Instructions

```swift

0. CocoaPods导入
//必须开使用静态库选项
use_frameworks!

//pod YogaKit
pod 'YogaKit'

```


### Method Description
```swift

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



