//
//  CAKeyframeAnimationCtrl.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/11.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "CAKeyframeAnimationCtrl.h"

@interface CAKeyframeAnimationCtrl ()

@end

@implementation CAKeyframeAnimationCtrl
/**
 *  关键帧动画（CAKeyframeAnimation）
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    //draw the path using a CAShapeLayer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.view.layer addSublayer:pathLayer];
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"Spark"].CGImage;
    [self.view.layer addSublayer:shipLayer];
    //create the keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = bezierPath.CGPath;
    
    /**
     *  设置rotationMode，调整运动方法，使视图指向曲线切线的方法
     */
    animation.rotationMode = kCAAnimationRotateAuto;
    
    [shipLayer addAnimation:animation forKey:nil];
    
    
    
    //add the ship
    CALayer *shipLayer2 = [CALayer layer];
    shipLayer2.frame = CGRectMake(100, 300, 128, 128);
    shipLayer2.position = CGPointMake(100, 300);
    shipLayer2.contents = (__bridge id)[UIImage imageNamed:@"Spark"].CGImage;
    [self.view.layer addSublayer:shipLayer2];
    //animate the ship rotation
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"transform";
    animation2.duration = 2.0;
//    animation2.byValue = @(M_PI * 2);
    animation2.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [shipLayer2 addAnimation:animation2 forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
