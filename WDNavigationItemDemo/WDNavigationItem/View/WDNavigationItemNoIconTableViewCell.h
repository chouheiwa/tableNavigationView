//
//  WDNavigationItemNoIconTableViewCell.h
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDNavigationItemModel;
@interface WDNavigationItemNoIconTableViewCell : UITableViewCell

@property (nonatomic,strong) UIView *lineView;

- (void)setModel:(WDNavigationItemModel *)model;

- (void)setShowHeadLine:(BOOL)showHead showTailLine:(BOOL)showTail lineColor:(UIColor *)color;

@end
