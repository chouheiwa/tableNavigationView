//
//  WDNavigationTableViewController.h
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDNavigationItemModel.h"

/**
 显示箭头的方向

 - ShowArrowKindNone: 无箭头 默认
 - ShowArrowKindUp: 箭头方向向上
 - ShowArrowKindDown: 箭头方向向下
 - ShowArrowKindLeft: 箭头方向向左
 - ShowArrowKindRight: 箭头方向向右
 */
typedef NS_ENUM(NSInteger,ShowArrowKind) {
    ShowArrowKindNone,
    ShowArrowKindUp = 1,
    ShowArrowKindDown,
    ShowArrowKindLeft,
    ShowArrowKindRight
};

@interface WDNavigationTableViewController : UIViewController

/**
 贴合的视图
 */
@property (nonatomic,strong) UIView *attachedView;

/**
 若显示箭头，则为箭头所在位置与贴合视图宽度/高度 百分比
 若没有箭头，则默认为展示showPoint所在位置
 */
@property (nonatomic,assign) CGFloat attachPercent;

@property (nonatomic,assign) CGFloat attachMargin;

/**
 在屏幕上显示的位置(若有箭头需在相应位置预留出对应单位的高度)
 */
@property (nonatomic,assign) CGPoint showPoint;

/**
 显示小箭头的位置，计算相对位置（相对于浮框的位置）
 */
@property (nonatomic,assign) CGFloat arcPoint;

/**
 0-1之间，为箭头在按钮上相对位置（优先级高于位置，若这个数字在0-1之外，则取arcPoint位置）
 */
@property (nonatomic,assign) CGFloat arcPositionPercent;

/**
 浮框的背景颜色
 */
@property (nonatomic,strong) UIColor *backColor;

/**
 显示箭头的位置
 
 */
@property (nonatomic,assign) ShowArrowKind kind;

/**
 无法小于30，若小于30，则为默认44的高度（不设置为44）
 Default is 44.If it's value is lower than 30,then will change to 44
 */
@property (nonatomic,assign) CGFloat rowHeight;

/**
 分割线的颜色（不设置为没有分割线）
 */
@property (nonatomic,strong) UIColor *lineColor;

/**
 分割线宽度占整体的百分比(0-1之间 默认是1)
 */
@property (nonatomic,assign) CGFloat lineWidthPercent;

/**
 显示文字上的颜色
 */
@property (nonatomic,strong) UIColor *textColor;

/**
 箭头高度
 */
@property (nonatomic,assign) CGFloat arcHeight;

/**
 箭头宽度
 */
@property (nonatomic,assign) CGFloat arcWidth;

/**
 给定视图的长度(若对该属性设置则不会再进行文字自适应布局)
 */
@property (nonatomic,assign) CGFloat viewLength;

/**
 展示的数组模型
 */
@property (nonatomic,strong) NSArray <__kindof WDNavigationItemModel *>*modelArray;

/**
 点击回调函数
 */
@property (nonatomic,copy) void(^touchIndex)(NSInteger index);

/**
 是否是测试模式(调试方法开启为长按2S以上其他地方)
 */
@property (nonatomic,assign) BOOL testMode;

- (void)show;

@end
