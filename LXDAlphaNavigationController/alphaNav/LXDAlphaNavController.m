//
//  LXDAlphaNavController.m
//  LXDAlphaNavigationController
//
//  Created by 林欣达 on 15/10/29.
//  Copyright © 2015年 sindri lin. All rights reserved.
//

#import "LXDAlphaNavController.h"

@interface LXDAlphaNavController ()

@property (nonatomic, strong) UIView * alphaView;
@property (nonatomic, strong) UIImage * alphaImage;

@end

@implementation LXDAlphaNavController
@synthesize barColor = _barColor;

- (void)awakeFromNib
{
    if (self.alphaImage) {  }
    [self.view insertSubview: self.alphaView belowSubview: self.navigationBar];
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

- (instancetype)initWithRootViewController: (UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController: rootViewController]) {
        if (self.alphaImage) {  }
        [self.view insertSubview: self.alphaView belowSubview: self.navigationBar];
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - getter
- (UIImage *)alphaImage
{
    if (!_alphaImage) {
        _alphaImage = [UIImage imageNamed: @"bigShadow"];
        [self.navigationBar setBackgroundImage: _alphaImage forBarMetrics: UIBarMetricsCompact];
        self.navigationBar.layer.masksToBounds = YES;
    }
    return _alphaImage;
}

- (UIView *)alphaView
{
    if (!_alphaView) {
        CGRect frame = self.navigationBar.frame;
        frame.size.height += CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
        _alphaView = [[UIView alloc] initWithFrame: frame];
        _alphaView.backgroundColor = self.barColor;
    }
    return _alphaView;
}

- (UIColor *)barColor
{
    if (!_barColor) {
        _barColor = [UIColor colorWithRed: 123/255.f green: 189/255.f blue: 229/255.f alpha: 1.f];
    }
    return _barColor;
}


#pragma mark - setter
- (void)setBarAlpha: (CGFloat)barAlpha
{
    if (self.alphaImage) {  }
    _barAlpha = barAlpha;
    self.alphaView.alpha = barAlpha;
}

- (void)setBarColor: (UIColor *)barColor
{
    if (self.alphaImage) {  }
    _barColor = barColor;
    _alphaView.backgroundColor = barColor;
}


@end
