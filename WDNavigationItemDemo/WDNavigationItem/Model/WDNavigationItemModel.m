//
//  WDNavigationItemModel.m
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import "WDNavigationItemModel.h"

@implementation WDNavigationItemModel

+ (instancetype)modelWithTitle:(NSString *)title iconImage:(NSString *)iconImage {
    return [[self alloc] initWithTitle:title iconImage:iconImage];
}

- (instancetype)initWithTitle:(NSString *)title iconImage:(NSString *)iconImage
{
    self = [super init];
    if (self) {
        _title = title;
        
        _iconImage = iconImage;
    }
    return self;
}

@end
