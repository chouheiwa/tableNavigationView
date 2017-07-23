//
//  ViewController.m
//  WDNavigationItemDemo
//
//  Created by hanlu on 17/4/28.
//  Copyright © 2017年 吴迪. All rights reserved.
//

#import "ViewController.h"
#import "WDNavigationTableViewController.h"

@interface ViewController ()

@property (nonatomic,assign) CGFloat value1;

@property (nonatomic,assign) ShowArrowKind kind;

@property (nonatomic,strong) UIView *v;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"11";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:({
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        button.frame =CGRectMake(0, 0, 40, 40);
        
        [button setTitle:@"111" forState:(UIControlStateNormal)];
        
        [button setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
        
        [button addTarget:self action:@selector(jump:) forControlEvents:(UIControlEventTouchUpInside)];
        
        _v = button;
        
        button;
    })];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGRect frame = [ViewController relativeFrameForScreenWithView:_v];
    
    NSLog(@"%@",NSStringFromCGRect(frame));
}

- (void)jump:(UIButton *)sender {
    WDNavigationTableViewController *nav = [[WDNavigationTableViewController alloc] init];
    
    nav.attachedView = sender;
    
    nav.attachPercent = 0.5;
    
    nav.attachMargin = 20;
    
    nav.viewLength = 200;
    
    //    nav.showPoint = CGPointMake(55, 100);
    
    nav.arcPositionPercent = ShowArrowKindUp;
    
    nav.backColor = [UIColor whiteColor];
    
    nav.kind = ShowArrowKindUp;
    
    nav.rowHeight = 40;
    
    nav.arcPositionPercent = 0.84;
    
    nav.testMode = YES;
    
    nav.modelArray = @[[WDNavigationItemModel modelWithTitle:@"扫一扫" iconImage:@"点击按钮_扫一扫"],[WDNavigationItemModel modelWithTitle:@"分享" iconImage:@"点击按钮_分享"],[WDNavigationItemModel modelWithTitle:@"常见问题" iconImage:@"questionLo"]];
    
    [nav setTouchIndex:^(NSInteger index) {
        
    }];
    
    [nav show];
}

- (IBAction)showAction:(UIButton *)sender {
    WDNavigationTableViewController *nav = [[WDNavigationTableViewController alloc] init];
    
    nav.attachedView = sender;
    
    nav.attachPercent = 0.5;
    
//    nav.showPoint = CGPointMake(55, 100);
    
    nav.arcPositionPercent = ShowArrowKindUp;
    
    nav.backColor = [UIColor whiteColor];
    
    nav.kind = _kind;
    
    nav.rowHeight = 40;
    
    nav.testMode = YES;
    
    nav.modelArray = @[[WDNavigationItemModel modelWithTitle:@"扫一扫" iconImage:@"点击按钮_扫一扫"],[WDNavigationItemModel modelWithTitle:@"分享" iconImage:@"点击按钮_分享"],[WDNavigationItemModel modelWithTitle:@"常见问题" iconImage:@"questionLo"]];
    
    [nav setTouchIndex:^(NSInteger index) {
        
    }];
    
    [nav show];
    
    
}
+ (CGRect)relativeFrameForScreenWithView:(UIView *)v
{
    BOOL iOS7 = [[[UIDevice currentDevice] systemVersion] floatValue] >= 7;
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (!iOS7) {
        screenHeight -= 20;
    }
    UIView *view = v;
    CGFloat x = .0;
    CGFloat y = .0;
    while (view.frame.size.width != 320 || view.frame.size.height != screenHeight) {
        x += view.frame.origin.x;
        y += view.frame.origin.y;
        
        if (!view.superview) break;
        view = view.superview;
        
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            x -= ((UIScrollView *) view).contentOffset.x;
            y -= ((UIScrollView *) view).contentOffset.y;
        }
    }
    return CGRectMake(x, y, v.frame.size.width, v.frame.size.height);
}

- (IBAction)touchAction:(UIButton *)sender {
    _kind = sender.tag;
}
- (IBAction)positionTouch:(UISlider *)sender {
    
    _value1 = sender.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
