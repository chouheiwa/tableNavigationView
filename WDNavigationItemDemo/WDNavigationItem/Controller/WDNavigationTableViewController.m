//
//  WDNavigationTableViewController.m
//  BankObject
//
//  Created by hanlu on 17/4/27.
//  Copyright © 2017年 袁伟森. All rights reserved.
//

#import "WDNavigationTableViewController.h"
#import "WDNavigationView.h"
#import "WDNavigationItemTableViewCell.h"
#import "WDNavigationItemNoIconTableViewCell.h"
#import "WDNavigationTestViewController.h"
#import "UIViewController+CurrentVC.h"
@interface WDNavigationTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *viewArray;

@property (nonatomic,strong) WDNavigationView *nav;

@end

@implementation WDNavigationTableViewController

+ (void)ShowFromVC:(UIViewController *)vc withShowPoint:(CGPoint)showPoint arcPosition:(CGFloat)arcPosition backColor:(UIColor *)backColor kind:(ShowArrowKind)kind modelArray:(NSArray <__kindof WDNavigationItemModel *>*)modelArray lineColor:(UIColor *)lineColor rowHeight:(CGFloat)rowHeight touchBlock:(void(^)(NSInteger index))touchBlock {
    WDNavigationTableViewController *nav = [[WDNavigationTableViewController alloc] initWithShowPoint:showPoint arcPosition:arcPosition backColor:backColor kind:kind lineColor:lineColor rowHeight:rowHeight modelArray:modelArray touchBlock:touchBlock];
    
    nav.view.alpha = 0;
    
    [vc addChildViewController:nav];
    
    [vc.view addSubview:nav.view];
    
    [UIView animateWithDuration:0.25 animations:^{
        nav.view.alpha = 1;
    }];
}

- (instancetype)initWithShowPoint:(CGPoint)showPoint arcPosition:(CGFloat)arcPosition backColor:(UIColor *)backColor kind:(ShowArrowKind)kind lineColor:(UIColor *)lineColor rowHeight:(CGFloat)rowHeight modelArray:(NSArray <__kindof WDNavigationItemModel *>*)modelArray touchBlock:(void(^)(NSInteger index))touchBlock{
    if (self = [super init]) {
        _showPoint = showPoint;
        
        _arcPoint = arcPosition;
        
        _backColor = backColor;
        
        _rowHeight = rowHeight;
        
        _lineColor = lineColor;
        
        _kind = kind;
        
        _modelArray = modelArray;
        
        _touchIndex = touchBlock;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = [UIScreen mainScreen].bounds;
    
    self.view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
    
    CGFloat rowHeight = _rowHeight >= 30?_rowHeight:44;
    
    CGFloat height = _modelArray.count * rowHeight;
    
    CGFloat width = [self getMaxLength];
    
    CGFloat maxLength = width;
    
    if (_kind == ShowArrowKindUp || _kind == ShowArrowKindDown) {
        maxLength = width;
    }else if(_kind == ShowArrowKindLeft || _kind == ShowArrowKindRight) {
        maxLength = height;
    }
    
    if (_arcPoint == 0) {
        _arcPoint = maxLength * 0.5;
    }
    
    if (_arcPositionPercent > 0 && _arcPositionPercent < 1) {
        _arcPoint = maxLength * _arcPositionPercent;
    }

    _nav = [[WDNavigationView alloc] initWithFrame:CGRectMake(_showPoint.x, _showPoint.y, width, height) showArrowKind:_kind withBackGroundColor:_backColor showShadow:YES arrowPosition:_arcPoint];
    
    [self.view addSubview:_nav];
    
    [_nav addObserver:self forKeyPath:@"center" options:(NSKeyValueObservingOptionNew) context:nil];
    
    _nav.tableView.delegate = self;
    _nav.tableView.dataSource = self;
    
    _nav.tableView.separatorStyle = NO;
    
    [_nav.tableView registerNib:[UINib nibWithNibName:@"WDNavigationItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"WDNavigationItemTableViewCell"];
    
    [_nav.tableView registerNib:[UINib nibWithNibName:@"WDNavigationItemNoIconTableViewCell" bundle:nil] forCellReuseIdentifier:@"WDNavigationItemNoIconTableViewCell"];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectZero];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectZero];
    
    _viewArray = @[view1,view2,view3,view4];
    
    if (_rowHeight >= 30) {
        _nav.tableView.rowHeight = _rowHeight;
    }
    
    for (int i = 0; i < _viewArray.count; i ++) {
        UIView *item = _viewArray[i];
        
        item.backgroundColor = [UIColor clearColor];
        
        [item addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)]];
        
        if (_testMode) {
            [item addGestureRecognizer:({
                UILongPressGestureRecognizer *rec = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(testLongPress:)];
                
                rec.minimumPressDuration = 2;
                
                rec;
            })];
        }
        
        [self.view addSubview:item];
    }
    
    [self layoutView:_nav.frame];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)close {
    
    
    [self.view removeFromSuperview];
    
    [self removeFromParentViewController];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([UIImage imageNamed:_modelArray[indexPath.row].iconImage]) {
        WDNavigationItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDNavigationItemTableViewCell" forIndexPath:indexPath];
        
        [cell setModel:_modelArray[indexPath.row]];
    
        [cell setShowHeadLine:(indexPath.row != 0 && _lineColor) showTailLine:(indexPath.row != _modelArray.count - 1) lineColor:_lineColor];
        
        cell.backgroundColor = [UIColor clearColor];
        
        return cell;
    }else {
        WDNavigationItemNoIconTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDNavigationItemNoIconTableViewCell" forIndexPath:indexPath];
        [cell setModel:_modelArray[indexPath.row]];
        
        [cell setShowHeadLine:(indexPath.row != 0 && _lineColor) showTailLine:(indexPath.row != _modelArray.count - 1) lineColor:_lineColor];
        
        cell.backgroundColor = [UIColor clearColor];
        
        return cell;
    }
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_touchIndex) {
        _touchIndex(indexPath.row);
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self close];
        }
    }];
}

- (CGFloat)getMaxLength {
    CGFloat length = 0;
    
    for (WDNavigationItemModel *model in _modelArray) {
        CGFloat latestLength = 0;
        
        if ([UIImage imageNamed:model.iconImage]) {
            latestLength = [model.title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width + 3 * 16 + 8;
        }else {
            latestLength = [model.title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width + 2 * 16;
        }
        
        if (latestLength > length) {
            length = latestLength;
        }
    }
    
    return ceil(length);
}

- (void)show {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [window addSubview:self.view];
    
    [[UIViewController currentViewController] addChildViewController:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"center"]) {
        [self layoutView:((UIView *)object).frame];
    }
}

- (void)testLongPress:(UILongPressGestureRecognizer *)rec {
    if (rec.state == UIGestureRecognizerStateBegan) {
        [WDNavigationTestViewController showWithView:_nav fromVC:self];
    }
}

- (void)layoutView:(CGRect)frame {
    NSArray *array = @[[NSValue valueWithCGRect:CGRectMake(0, 0, self.view.frame.size.width, CGRectGetMinY(frame))],[NSValue valueWithCGRect:CGRectMake(0, CGRectGetMinY(frame), CGRectGetMinX(frame), CGRectGetHeight(frame))],[NSValue valueWithCGRect:CGRectMake(CGRectGetMaxX(frame), CGRectGetMinY(frame), self.view.frame.size.width - CGRectGetMaxX(frame), CGRectGetHeight(frame))],[NSValue valueWithCGRect:CGRectMake(0, CGRectGetMaxY(frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(frame))]];
    
    for (int i = 0; i < _viewArray.count; i ++) {
        UIView *item = _viewArray[i];
        
        CGRect frame = ((NSValue *)[array objectAtIndex:i]).CGRectValue;
        
        item.frame = frame;
    }
}

- (void)dealloc {
    [_nav removeObserver:self forKeyPath:@"center"];
}
@end
