//
//  CABasicAnimationCtrl.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/11.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "CABasicAnimationCtrl.h"

@interface CABasicAnimationCtrl ()
@property (nonatomic, strong) CALayer *colorLayer;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIImageView *clockHand;

@property (nonatomic, strong) UIImageView *hourHand;
@property (nonatomic, strong) UIImageView *minuteHand;
@property (nonatomic, strong) UIImageView *secondHand;

@property (nonatomic, weak) NSTimer *timer;
@end

@implementation CABasicAnimationCtrl
/**
 *  属性动画（CABasicAnimation）
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(100, 100, 150, 50);
    [self.button setTitle:@"Change Color" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    
    //create sublayer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(100.0f, 200.0f, 150.0f, 150.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //add it to our view
    [self.view.layer addSublayer:self.colorLayer];
    
    
    
    
    
    
    self.clockHand = [[UIImageView alloc] initWithFrame:CGRectMake(50, 400, 100, 100)];
    self.clockHand.image = [UIImage imageNamed:@"clock"];
    [self.view addSubview:self.clockHand];
    
    self.hourHand = [[UIImageView alloc] initWithFrame:CGRectMake(95, 400, 10, 100)];
    self.hourHand.image = [UIImage imageNamed:@"hour"];
    [self.view addSubview:self.hourHand];
    
    self.minuteHand = [[UIImageView alloc] initWithFrame:CGRectMake(95, 400, 10, 100)];
    self.minuteHand.image = [UIImage imageNamed:@"minute"];
    [self.view addSubview:self.minuteHand];
    
    self.secondHand = [[UIImageView alloc] initWithFrame:CGRectMake(95, 400, 10, 100)];
    self.secondHand.image = [UIImage imageNamed:@"second"];
    [self.view addSubview:self.secondHand];
    
    /**
     *  anchorPoint用单位坐标来描述，也就是图层的相对坐标，图层左上角是{0, 0}，右下角是{1, 1}，因此默认坐标是{0.5, 0.5}。
     *  anchorPoint可以通过指定x和y值小于0或者大于1，使它放置在图层范围之外。
     */
    self.secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    //start timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    //set initial hand positions
    [self tick];


}

- (void)changeColor
{
    //create a new random color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    //create a basic animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    animation.delegate = self;
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
}

/**
 *  上面动画，对应的是这个代理实现
 */
//- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
//{
//    //set the backgroundColor property to match animation toValue
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
//    [CATransaction commit];
//}


/**
 *  使用KVC对动画打标签
 */

- (void)tick
{
    [self updateHandsAnimated:YES];
}

- (void)updateHandsAnimated:(BOOL)animated
{
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hourAngle = (components.hour / 12.0) * M_PI * 2.0;
    //calculate hour hand angle //calculate minute hand angle
    CGFloat minuteAngle = (components.minute / 60.0) * M_PI * 2.0;
    //calculate second hand angle
    CGFloat secondAngle = (components.second / 60.0) * M_PI * 2.0;
    //rotate hands
    [self setAngle:hourAngle forHand:self.hourHand animated:animated];
    [self setAngle:minuteAngle forHand:self.minuteHand animated:animated];
    [self setAngle:secondAngle forHand:self.secondHand animated:animated];
}

- (void)setAngle:(CGFloat)angle forHand:(UIView *)handView animated:(BOOL)animated
{
    //generate transform
    CATransform3D transform = CATransform3DMakeRotation(angle, 0, 0, 1);
    if (animated) {
        //create transform animation
        CABasicAnimation *animation = [CABasicAnimation animation];
        [self updateHandsAnimated:NO];
        animation.keyPath = @"transform";
        animation.toValue = [NSValue valueWithCATransform3D:transform];
        animation.duration = 0.5;
        animation.delegate = self;
        [animation setValue:handView forKey:@"handView"];
        [handView.layer addAnimation:animation forKey:nil];
    } else {
        //set transform directly
        handView.layer.transform = transform;
    }
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    //set final position for hand view
    UIView *handView = [anim valueForKey:@"handView"];
    handView.layer.transform = [anim.toValue CATransform3DValue];
}



@end
