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

@property (nonatomic,assign) CGFloat lineWidthPercent;

@end


@implementation WDNavigationItemNoIconTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _headLineView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:_headLineView];
    
    _tailLineView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:_tailLineView];
    
//    [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
}

- (void)setModel:(WDNavigationItemModel *)model {
    _titleLabel.text = model.title;
}

- (void)setLabelColor:(UIColor *)labelColor {
    _titleLabel.textColor = labelColor;
}

- (void)setShowHeadLine:(BOOL)showHead showTailLine:(BOOL)showTail lineColor:(UIColor *)color{
    _headLineView.hidden = !showHead;
    
    _tailLineView.hidden = !showTail;
    
    _headLineView.backgroundColor = color;
    
    _tailLineView.backgroundColor = color;
}

- (void)setLineWidthPercent:(CGFloat)percent {
    _lineWidthPercent = percent;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.frame);
    
    if (_lineWidthPercent != 0) {
        width = width * _lineWidthPercent;
    }
    
    _headLineView.frame = CGRectMake((1 - _lineWidthPercent) * CGRectGetWidth(self.frame) / 2, 0, width, 0.25);
    
    _tailLineView.frame = CGRectMake((1 - _lineWidthPercent) * CGRectGetWidth(self.frame) / 2, self.frame.size.height - 0.25, width, 0.25);
}
@end
