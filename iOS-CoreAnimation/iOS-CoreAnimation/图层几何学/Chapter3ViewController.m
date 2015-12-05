//
//  Chapter3ViewController.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "Chapter3ViewController.h"

@interface Chapter3ViewController ()
@property (nonatomic, strong) UIImageView *clockHand;
@property (nonatomic, strong) UIImageView *hourHand;
@property (nonatomic, strong) UIImageView *minuteHand;
@property (nonatomic, strong) UIImageView *secondHand;
@property (nonatomic, weak) NSTimer *timer;


@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;


@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;

@end

@implementation Chapter3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     *  锚点
     */
    [self anchorView];

    /**
     *  坐标系
     */
    [self postionView];
    
    /**
     *  点击测试
     */
    [self hitTestingView];
}

#pragma mark - 锚点
- (void)anchorView
{
    /**
     有点丑，效果还是实现了
     */
    self.clockHand = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
    self.clockHand.image = [UIImage imageNamed:@"clock"];
    [self.view addSubview:self.clockHand];
    
    self.hourHand = [[UIImageView alloc] initWithFrame:CGRectMake(95, 200, 10, 100)];
    self.hourHand.image = [UIImage imageNamed:@"hour"];
    [self.view addSubview:self.hourHand];
    
    self.minuteHand = [[UIImageView alloc] initWithFrame:CGRectMake(95, 200, 10, 100)];
    self.minuteHand.image = [UIImage imageNamed:@"minute"];
    [self.view addSubview:self.minuteHand];
    
    self.secondHand = [[UIImageView alloc] initWithFrame:CGRectMake(95, 200, 10, 100)];
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

- (void)tick
{
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    //calculate hour hand angle //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    //rotate hands
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secsAngle);
}

#pragma mark -坐标系
- (void)postionView
{
    self.greenView = [[UIView alloc] initWithFrame:CGRectMake(10, 400, 100, 100)];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(50, 450, 100, 100)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    /**
     *  给zPosition提高一个像素就可以让绿色视图前置
     */
    self.greenView.layer.zPosition = 1.0f;
    
    
    CGPoint point =  [self.view.layer convertPoint:CGPointMake(0, 0) fromLayer:self.greenView.layer];
    NSLog(@"%@", NSStringFromCGPoint(point));
    
}

#pragma mark - Hit Testing
- (void)hitTestingView
{
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(250.0f, 100.0f, 100.0f, 100.0f)];
    self.layerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView];
    
    
    //create sublayer
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.layerView.layer addSublayer:self.blueLayer];
}
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //get touch position relative to main view
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    //convert point to the white layer's coordinates
//    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
//    //get layer using containsPoint:
    //-containsPoint:接受一个在本图层坐标系下的CGPoint，如果这个点在图层frame范围内就返回YES。
//    if ([self.layerView.layer containsPoint:point]) {
//        //convert point to blueLayer’s coordinates
//        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
//        if ([self.blueLayer containsPoint:point]) {
//            [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
//                                        message:nil
//                                       delegate:nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil] show];
//        } else {
//            [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
//                                        message:nil
//                                       delegate:nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil] show];
//        }
//    }
//}


/**
 *
 *  使用hitTest判断被点击的图层
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get touch position
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //get touched layer
    CALayer *layer = [self.layerView.layer hitTest:point];
    //get layer using hitTest
    if (layer == self.blueLayer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if (layer == self.layerView.layer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}


@end
