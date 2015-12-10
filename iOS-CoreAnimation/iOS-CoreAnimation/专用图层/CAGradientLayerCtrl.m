//
//  CAGradientLayerCtrl.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "CAGradientLayerCtrl.h"

@interface CAGradientLayerCtrl ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *containerView2;

@end

@implementation CAGradientLayerCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];
    
    self.containerView2 = [[UIView alloc] initWithFrame:CGRectMake(100, 350, 200, 200)];
    self.containerView2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView2];
    
    /**
     *  基础渐变
     */
    //create gradient layer and add it to our container view
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:gradientLayer];
    
    //set gradient colors
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    
    //set gradient start and end points
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
    
    /**
     *  多重渐变
     */
    
    //create gradient layer and add it to our container view
    CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];
    gradientLayer2.frame = self.containerView2.bounds;
    [self.containerView2.layer addSublayer:gradientLayer2];
    
    //set gradient colors
    gradientLayer2.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id) [UIColor yellowColor].CGColor, (__bridge id)[UIColor greenColor].CGColor];
    
    //set gradientLayer2
    // 使用 locations 属性调整空间，定义了colors 属性中每个不同颜色的位置，0.0 代表渐变的开始，1.0代表着结束
    gradientLayer.locations = @[@0.0, @0.25, @0.5];
    
    //set gradient start and end points
    gradientLayer2.startPoint = CGPointMake(0, 0);
    gradientLayer2.endPoint = CGPointMake(1, 1);
    
    
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
