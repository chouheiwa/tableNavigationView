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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (IBAction)showAction:(UIButton *)sender {
    WDNavigationTableViewController *nav = [[WDNavigationTableViewController alloc] init];
    
    nav.showPoint = CGPointMake(55, 100);
    
    nav.arcPositionPercent = _value1;
    
    nav.backColor = [UIColor whiteColor];
    
    nav.kind = _kind;
    
    nav.rowHeight = 40;
    
    nav.testMode = YES;
    
    nav.modelArray = @[[WDNavigationItemModel modelWithTitle:@"扫一扫" iconImage:@"点击按钮_扫一扫"],[WDNavigationItemModel modelWithTitle:@"分享" iconImage:@"点击按钮_分享"],[WDNavigationItemModel modelWithTitle:@"常见问题" iconImage:@"questionLo"]];
    
    [nav setTouchIndex:^(NSInteger index) {
        
    }];
    
    [nav show];
    
    
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
