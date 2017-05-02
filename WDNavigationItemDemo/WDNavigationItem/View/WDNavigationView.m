//
//  WDNavigationView.m
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import "WDNavigationView.h"

@interface WDNavigationView ()
@property (nonatomic,strong) UIColor *backColor;

@property (nonatomic,assign) ShowArrowKind initKind;

@property (nonatomic,assign) CGRect initFrame;
@end

@implementation WDNavigationView

- (instancetype)initWithFrame:(CGRect)frame showArrowKind:(ShowArrowKind)kind withBackGroundColor:(UIColor *)backColor showShadow:(BOOL)shadow arrowPosition:(CGFloat)arrowPosition{
    if (self = [super initWithFrame:frame]) {
        _backColor = backColor;
        
        _kind = kind;
        
        _initKind = kind;
        
        _initFrame = frame;
        
        if (shadow) {
            self.layer.shadowColor=[[UIColor grayColor] colorWithAlphaComponent:0.8].CGColor;
            
            self.layer.shadowOffset=CGSizeMake(0,0);
            
            self.layer.shadowOpacity=0.5;
            
            self.layer.shadowRadius=8;
        }
        
        _arrowPosition = arrowPosition;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        _tableView.backgroundColor = [UIColor clearColor];
        
        _tableView.scrollEnabled = NO;
        
        self.backgroundColor = [UIColor clearColor];
        
        [self setKind:kind];
        
        [self addSubview:_tableView];
    }
    return self;
}


- (void)setKind:(ShowArrowKind)kind {
    CGRect rect = self.bounds;
    rect.size = _initFrame.size;
    
    CGRect rect1 = self.frame;
    
    _kind = kind;
    switch (kind) {
        case ShowArrowKindUp: 
            rect.origin.y = 8;
            
            rect1.size.height = _initFrame.size.height + 8;
            rect1.size.width = _initFrame.size.width;
            break;
        case ShowArrowKindDown:
            rect1.size.height = _initFrame.size.height + 8;
            rect1.size.width = _initFrame.size.width;
            break;
        case ShowArrowKindLeft:
            rect.origin.x = 8;
            rect1.size.width = _initFrame.size.width + 8;
            rect1.size.height = _initFrame.size.height;
            break;
        case ShowArrowKindRight:
            rect1.size.width = _initFrame.size.width + 8;
            rect1.size.height = _initFrame.size.height;
            break;
        default:
            break;
    }
    
    _tableView.frame = rect;
    
    self.frame = rect1;
}

- (void)drawRect:(CGRect)rect {
    [_backColor setFill];
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_tableView.frame byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(5, 5)];
    
    
    [path fill];
    
    switch (_kind) {
        case ShowArrowKindUp: {
            CGPoint point1 = CGPointMake(_arrowPosition - 6, 16);
            CGPoint point2 = CGPointMake(_arrowPosition, 0);
            CGPoint point3 = CGPointMake(_arrowPosition + 6, 16);
            
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:point1];
            
            [path addLineToPoint:point2];
            
            [path addLineToPoint:point3];
            
            [path closePath];
            
            [path fill];
        }
            break;
        case ShowArrowKindDown:{
            CGPoint point1 = CGPointMake(_arrowPosition - 6, CGRectGetMaxY(_tableView.frame) - 8);
            CGPoint point2 = CGPointMake(_arrowPosition, rect.size.height);
            CGPoint point3 = CGPointMake(_arrowPosition + 6, CGRectGetMaxY(_tableView.frame) - 8);
            
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:point1];
            
            [path addLineToPoint:point2];
            
            [path addLineToPoint:point3];
            
            [path closePath];
            
            [path fill];
        }
            break;
        case ShowArrowKindLeft:{
            CGPoint point1 = CGPointMake(16, _arrowPosition + 6);
            CGPoint point2 = CGPointMake(0, _arrowPosition);
            CGPoint point3 = CGPointMake(16, _arrowPosition - 6);
            
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:point1];
            
            [path addLineToPoint:point2];
            
            [path addLineToPoint:point3];
            
            [path closePath];
            
            [path fill];
        }
            
            break;
        case ShowArrowKindRight:{
            CGPoint point1 = CGPointMake(CGRectGetMaxX(_tableView.frame) - 8, _arrowPosition + 6);
            CGPoint point2 = CGPointMake(rect.size.width, _arrowPosition);
            CGPoint point3 = CGPointMake(CGRectGetMaxX(_tableView.frame) - 8, _arrowPosition - 6);
            
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:point1];
            
            [path addLineToPoint:point2];
            
            [path addLineToPoint:point3];
            
            [path closePath];
            
            [path fill];
        }
            
            break;
        default:
            break;
    }
    
    
}

@end
