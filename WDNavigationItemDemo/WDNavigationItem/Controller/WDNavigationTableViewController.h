//
//  WDNavigationTableViewController.h
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDNavigationItemModel.h"
typedef NS_ENUM(NSInteger,ShowArrowKind) {
    ShowArrowKindNone,
    ShowArrowKindUp = 1,
    ShowArrowKindDown,
    ShowArrowKindLeft,
    ShowArrowKindRight
};

@interface WDNavigationTableViewController : UIViewController

/**
 在屏幕上显示的位置(若有箭头需在相应位置预留出8个单位的高度)
 */
@property (nonatomic,assign) CGPoint showPoint;

/**
 显示小箭头的位置，计算相对位置（相对于付出框的位置）
 */
@property (nonatomic,assign) CGFloat arcPoint;

/**
 0-1之前，为箭头在按钮上相对位置（优先级高于位置，若这个数字在0-1之外，则取arcPoint位置）
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
 */
@property (nonatomic,assign) CGFloat rowHeight;

/**
 分割线的颜色（不设置为没有分割线）
 */
@property (nonatomic,strong) UIColor *lineColor;

/**
 展示的数组模型
 */
@property (nonatomic,strong) NSArray <__kindof WDNavigationItemModel *>*modelArray;

/**
 点击回调函数
 */
@property (nonatomic,copy) void(^touchIndex)(NSInteger index);

/**
 是否是测试模式
 */
@property (nonatomic,assign) BOOL testMode;

/*
 在页面上展示一个按钮列表

 @param vc          从哪个控制器展示
 @param showPoint   在屏幕上的哪个位置显示
 @param arcPosition 显示小箭头的位置
 @param backColor   背景颜色（不设置为没有颜色）
 @param kind        箭头防向（上下左右 无）
 @param modelArray  数据来源数组（大小为自适应数组中title最长的//未做换行处理）
 @param lineColor   显示分割线的颜色（传空为不显示）
 @param rowHeight   行高，默认为44，大于30才修改
 @param touchBlock  点击事件
 */
+ (void)ShowFromVC:(UIViewController *)vc withShowPoint:(CGPoint)showPoint arcPosition:(CGFloat)arcPosition backColor:(UIColor *)backColor kind:(ShowArrowKind)kind modelArray:(NSArray <__kindof WDNavigationItemModel *>*)modelArray lineColor:(UIColor *)lineColor rowHeight:(CGFloat)rowHeight touchBlock:(void(^)(NSInteger index))touchBlock;

- (void)show;

@end
