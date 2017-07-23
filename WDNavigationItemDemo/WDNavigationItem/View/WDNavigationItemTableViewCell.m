//
//  WDNavigationItemTableViewCell.m
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import "WDNavigationItemTableViewCell.h"
#import "WDNavigationItemModel.h"
@interface WDNavigationItemTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@property (nonatomic,strong) UIView *headLineView;

@property (nonatomic,strong) UIView *tailLineView;

@property (nonatomic,assign) CGFloat lineWidthPercent;

@end

@implementation WDNavigationItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _headLineView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:_headLineView];
    
    _tailLineView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:_tailLineView];
    
//    [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
}

- (void)setLabelColor:(UIColor *)labelColor {
    _showLabel.textColor = labelColor;
}

- (void)setModel:(WDNavigationItemModel *)model {
    _showLabel.text = model.title;
    
    _iconImageV.image = [UIImage imageNamed:model.iconImage];
}

- (void)setShowHeadLine:(BOOL)showHead showTailLine:(BOOL)showTail lineColor:(UIColor *)color{
    _headLineView.hidden = !showHead;
    
    _tailLineView.hidden = !showTail;
    
    _headLineView.backgroundColor = color;
    
    _tailLineView.backgroundColor = color;
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

- (void)setLineWidthPercent:(CGFloat)percent {
    _lineWidthPercent = percent;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

@end
