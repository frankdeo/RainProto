//
//  ViewController.m
//  RainProto
//
//  Created by Frank on 3/11/19.
//  Copyright © 2019 Version 40 Software, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self doRain];
}

- (void) doRain {
    int randomX = arc4random_uniform((u_int32_t)(self.view.frame.size.width));
    int randomY = arc4random_uniform((u_int32_t)(self.view.frame.size.height));
    
    // Create a view with a corner radius as the circle
    UIView* circle = [[UIView alloc] initWithFrame:CGRectMake(randomX, randomY, 10, 10)];
    UIView* dot = [[UIView alloc] initWithFrame:CGRectMake(randomX + 5, randomY + 5, 1, 1)];
    
    [circle.layer setCornerRadius:circle.frame.size.width / 2];
    [circle.layer setBorderColor:[UIColor grayColor].CGColor];
    [circle.layer setBorderWidth:.25];
    
    [dot setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:circle];
    [self.view addSubview:dot];
    
    [UIView animateWithDuration:.5 animations:^{
        // Animate it to double the size
        const CGFloat scale = 2;
        [circle setTransform:CGAffineTransformMakeScale(scale, scale)];
        
    } completion:^(BOOL finished) {
        
        [circle removeFromSuperview];
        [dot removeFromSuperview];
         
        [self doRain];
    }];
}

@end
