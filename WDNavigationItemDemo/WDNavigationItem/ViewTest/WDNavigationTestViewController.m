//
//  WDNavigationTestViewController.m
//  WDNavigationItemDemo
//
//  Created by hanlu on 17/5/2.
//  Copyright © 2017年 吴迪. All rights reserved.
//

#import "WDNavigationTestViewController.h"
#import "WDNavigationView.h"
#import "UIViewController+CurrentVC.h"

@interface WDNavigationTestViewController ()
@property (weak, nonatomic) IBOutlet UISlider *arcPositionSlider;
@property (weak, nonatomic) IBOutlet UISlider *xPositionSlider;
@property (weak, nonatomic) IBOutlet UISlider *yPositionSlider;

@property (nonatomic,strong) UIView *changeView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightContraint;
@property (weak, nonatomic) IBOutlet UILabel *yPositionLabel;
@property (weak, nonatomic) IBOutlet UILabel *xPositionLabel;
@property (weak, nonatomic) IBOutlet UILabel *arcPositionLabel;

@end

@implementation WDNavigationTestViewController

+ (void)showWithView:(UIView *)view fromVC:(UIViewController *)baseVC{
    WDNavigationTestViewController *vc = [[WDNavigationTestViewController alloc] init];
    
    vc.changeView = view;
    
    [baseVC.view addSubview: vc.view];
    
    [baseVC addChildViewController:vc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.alpha = 0.5;
    
    _yPositionSlider.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    self.view.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 292 , [UIScreen mainScreen].bounds.size.width, 292);
    
    if ([_changeView isKindOfClass:[WDNavigationView class]]) {
        UIView *parentView = _changeView.superview;
        
        CGRect frame = parentView.bounds;
        
        if (!parentView) {
            frame = [UIScreen mainScreen].bounds;
        }
        
        _xPositionSlider.value = _changeView.frame.origin.x / frame.size.width;
        
        _yPositionSlider.value = _changeView.frame.origin.y / frame.size.height;
        
        _yPositionLabel.text = [NSString stringWithFormat:@"Y:%.2f",_changeView.frame.origin.y];
        
        _xPositionLabel.text = [NSString stringWithFormat:@"X:%.2f",_changeView.frame.origin.x];

    }
}


- (IBAction)actionBtnClick:(UIButton *)sender {
    if ([_changeView isKindOfClass:[WDNavigationView class]]) {
        WDNavigationView *view = (WDNavigationView *)_changeView;
        
        view.kind = sender.tag;
        
        [view setNeedsDisplay];
    }
}

- (IBAction)sliderAction:(id)sender {
    UIView *parentView = _changeView.superview;
    
    CGRect frame = parentView.bounds;
    
    if (!parentView) {
        frame = [UIScreen mainScreen].bounds;
    }
    
    if (sender == _arcPositionSlider) {
        frame = _changeView.frame;
        
        WDNavigationView *view = (WDNavigationView *)_changeView;
        
        CGFloat position = 0;
        
        _arcPositionLabel.text = [NSString stringWithFormat:@"箭头位置:%.2f",_arcPositionSlider.value];
        
        switch (view.kind) {
            case ShowArrowKindRight:
            case ShowArrowKindLeft:
                position = frame.size.height * _arcPositionSlider.value;
                break;
            case ShowArrowKindDown:
            case ShowArrowKindUp:
                position = frame.size.width * _arcPositionSlider.value;
                break;
            default:
                break;
        }
        
        view.arrowPosition = position;
        
        [view setNeedsDisplay];
    }else if (sender == _xPositionSlider || sender == _yPositionSlider) {
        CGFloat x = _xPositionSlider.value * (frame.size.width - _changeView.frame.size.width) + _changeView.frame.size.width / 2;
        
        CGFloat y = _yPositionSlider.value * (frame.size.height - _changeView.frame.size.height) + _changeView.frame.size.height / 2;
        
        _xPositionLabel.text = [NSString stringWithFormat:@"X:%.2f",x - _changeView.frame.size.width / 2];
        
        _yPositionLabel.text = [NSString stringWithFormat:@"Y:%.2f",y - _changeView.frame.size.height / 2];
        
        _changeView.center = CGPointMake(x, y);
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
