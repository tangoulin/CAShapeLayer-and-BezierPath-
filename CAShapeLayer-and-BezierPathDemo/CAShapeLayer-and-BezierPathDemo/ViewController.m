//
//  ViewController.m
//  CAShapeLayer-and-BezierPathDemo
//
//  Created by tangoulin on 16/11/12.
//  Copyright © 2016年 tony. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demoLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self animationLayer];
}


- (void)animationLayer{
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    CGFloat radius = 50;
    CGFloat margin = 20;
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = self.view.bounds.size.height;

    CGRect rect = CGRectMake(viewWidth - radius - margin, margin, radius, radius);
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    layer.path = beginPath.CGPath;

     CGFloat maxRadius = sqrt(viewWidth * viewWidth + viewHeight * viewHeight);
    
    CGRect endRect = CGRectInset(rect, -maxRadius, -maxRadius);
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:endRect];
    
    self.view.layer.mask = layer;

     CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    
    anim.duration = 3;
    anim.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    anim.toValue = (__bridge id _Nullable)(endPath.CGPath);
    
    anim.fillMode = kCAFillModeForwards;
    
    anim.removedOnCompletion = NO;
    
    [layer addAnimation:anim forKey:nil];

}

- (void)demoLayer {
    
//    CAShapeLayer *layer = [CAShapeLayer layer];
//
//    
//    CGFloat radius = 50;
//    CGFloat margin = 20;
//    CGFloat viewWidth = self.view.bounds.size.width;
//    CGFloat viewHeight = self.view.bounds.size.height;
}
@end
