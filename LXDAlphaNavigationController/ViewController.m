//
//  ViewController.m
//  LXDAlphaNavigationController
//
//  Created by 林欣达 on 15/10/29.
//  Copyright © 2015年 sindri lin. All rights reserved.
//

#import "ViewController.h"
#import "LXDAlphaNavController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self alphaNavController].barAlpha = 0.f;
    [self.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - getter
- (LXDAlphaNavController *)alphaNavController
{
    return (LXDAlphaNavController *)self.navigationController;
}


#pragma mark - observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    CGFloat offset = self.tableView.contentOffset.y;
    CGFloat delta = offset / 64.f + 1.f;
    delta = MAX(0, delta);
    [self alphaNavController].barAlpha = MIN(1, delta);
}


@end
