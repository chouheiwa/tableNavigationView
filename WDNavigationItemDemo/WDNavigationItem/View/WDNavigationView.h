//
//  WDNavigationView.h
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WDNavigationTableViewController.h"

@interface WDNavigationView : UIView

@property (nonatomic,assign) CGFloat arrowPosition;

@property (nonatomic,assign) ShowArrowKind kind;

@property (nonatomic,strong,readonly) UITableView *tableView;

/**
 是否显示三角形

 @param frame <#frame description#>


 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame showArrowKind:(ShowArrowKind)kind withBackGroundColor:(UIColor *)backColor showShadow:(BOOL)shadow arrowPosition:(CGFloat)arrowPosition;

@end
