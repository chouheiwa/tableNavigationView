//
//  WDNavigationItemModel.h
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDNavigationItemModel : NSObject

/**
 显示文字
 */
@property (nonatomic,copy,readonly) NSString *title;

/**
 显示的图片
 */
@property (nonatomic,copy,readonly) NSString *iconImage;

+ (instancetype)modelWithTitle:(NSString *)title iconImage:(NSString *)iconImage;

@end
