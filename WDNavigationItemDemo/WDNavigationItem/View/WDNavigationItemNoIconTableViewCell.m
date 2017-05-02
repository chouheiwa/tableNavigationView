//
//  WDNavigationItemNoIconTableViewCell.m
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import "WDNavigationItemNoIconTableViewCell.h"
#import "WDNavigationItemModel.h"

@interface WDNavigationItemNoIconTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic,strong) UIView *headLineView;

@property (nonatomic,strong) UIView *tailLineView;

@end


@implementation WDNavigationItemNoIconTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _headLineView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:_headLineView];
    
    _tailLineView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:_tailLineView];
}

- (void)setModel:(WDNavigationItemModel *)model {
    _titleLabel.text = model.title;
}

- (void)setShowHeadLine:(BOOL)showHead showTailLine:(BOOL)showTail lineColor:(UIColor *)color{
    _headLineView.hidden = !showHead;
    
    _tailLineView.hidden = !showTail;
    
    _headLineView.backgroundColor = color;
    
    _tailLineView.backgroundColor = color;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _headLineView.frame = CGRectMake(0, 0, self.frame.size.width, 0.5);
    
    _tailLineView.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
}
@end
