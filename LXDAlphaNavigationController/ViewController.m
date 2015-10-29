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

@property (strong, nonatomic) IBOutlet UISlider *red;
@property (strong, nonatomic) IBOutlet UISlider *green;
@property (strong, nonatomic) IBOutlet UISlider *blue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.navigationController.class);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - event
- (IBAction)rgbChange:(UISlider *)sender
{
    [self alphaNavController].barColor = [UIColor colorWithRed: _red.value/255.f green: _green.value/255.f blue: _blue.value/255.f alpha: 1.f];
}


- (IBAction)alphaChange:(UISlider *)sender
{
    [self alphaNavController].barAlpha = sender.value;
}


#pragma mark - getter
- (LXDAlphaNavController *)alphaNavController
{
    return (LXDAlphaNavController *)self.navigationController;
}


@end
