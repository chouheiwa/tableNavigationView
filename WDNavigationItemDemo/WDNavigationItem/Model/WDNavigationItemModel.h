//
//  WDNavigationItemModel.h
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDNavigationItemModel : NSObject

@property (nonatomic,strong,readonly) NSString *title;

@property (nonatomic,strong,readonly) NSString *iconImage;

+ (instancetype)modelWithTitle:(NSString *)title iconImage:(NSString *)iconImage;

@end
