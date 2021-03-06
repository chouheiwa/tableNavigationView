//
//  WDNavigationItemTableViewCell.h
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDNavigationItemModel;

@interface WDNavigationItemTableViewCell : UITableViewCell

- (void)setModel:(WDNavigationItemModel *)model;

- (void)setShowHeadLine:(BOOL)showHead showTailLine:(BOOL)showTail lineColor:(UIColor *)color;

- (void)setLabelColor:(UIColor *)labelColor;

- (void)setLineWidthPercent:(CGFloat)percent;

@end
