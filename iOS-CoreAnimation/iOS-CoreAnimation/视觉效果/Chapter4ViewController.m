//
//  Chapter4ViewController.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "Chapter4ViewController.h"
#import "GroupOpacityViewController.h"

@interface Chapter4ViewController ()
@property (nonatomic, strong) UIView *layerView1;
@property (nonatomic, strong) UIView *layerView2;

@property (nonatomic, strong) UIImageView *layerView3;
@property (nonatomic, strong) UIImageView *layerView4;

@property (nonatomic, strong) UIImageView *layerView5;
@property (nonatomic, strong) UIImageView *maskImageView;



@end

@implementation Chapter4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layerView1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    self.layerView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView1];
    
    self.layerView2 = [[UIView alloc] initWithFrame:CGRectMake(-50, -20, 100, 100)];
    self.layerView2.backgroundColor = [UIColor redColor];
    [self.layerView1 addSubview:self.layerView2];
    
    self.layerView3 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
    self.layerView3.image = [UIImage imageNamed:@"haha"];
    [self.view addSubview:self.layerView3];
    
    self.layerView4 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 300, 100, 100)];
    self.layerView4.image = [UIImage imageNamed:@"haha"];
    [self.view addSubview:self.layerView4];
    
    self.layerView5 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 420, 100, 100)];
//    self.layerView5.image = [UIImage imageNamed:@"clock"];
    [self.view addSubview:self.layerView5];
    
    self.maskImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 420, 100, 100)];
    self.maskImageView.image = [UIImage imageNamed:@"clock"];
    [self.view addSubview:self.maskImageView];
    

    
    [self cornerRadiusView];
    
    [self layerBorderView];
    
    [self shadowView];
    
    [self layerMaskView];
    
}

/**
 *  圆角
 */
- (void)cornerRadiusView
{

    
    /**
     *  cornerRadius
     *  设置圆角
     */
//    self.layerView1.layer.cornerRadius = 20.0f;
//    self.layerView2.layer.cornerRadius = 20.0f;
    
    /**
     *  裁剪超出范围的子视图，当使用裁剪的时候，阴影属性的作用将没有效果
     */
//    self.layerView1.layer.masksToBounds = YES;
}

/**
 *  图层边框
 */
- (void)layerBorderView
{
    /**
     *  borderWidth是以点为单位的定义边框粗细的浮点数，默认为0
     *  borderColor定义了边框的颜色，默认为黑色
     */
    self.layerView2.layer.borderWidth = 5.0f;
    
//    self.layerView1.layer.borderColor = [UIColor blackColor].CGColor;
    
}

/**
 *  阴影
 */
- (void)shadowView
{
    // shadowOpacity是一个必须在0.0（不可见）和1.0（完全不透明）之间的浮点数
    self.layerView1.layer.shadowOpacity = 0.5f;
    // shadowOffset属性控制着阴影的方向和距离。它是一个CGSize的值，宽度控制这阴影横向的位移，高度控制着纵向的位移。
    // shadowOffset的默认值是 {0, -3}，意即阴影相对于Y轴有3个点的向上位移。
    self.layerView1.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    
    self.layerView1.layer.shadowRadius = 5.0f;
    self.layerView1.layer.shadowColor = [UIColor blackColor].CGColor;
    
    
    /**
     *  裁剪超出范围的子视图，当使用裁剪的时候，阴影属性的作用将没有效果
     */
    //    self.layerView1.layer.masksToBounds = YES;
    
    
    
    
    self.layerView3.layer.shadowOpacity = 0.5f;
    self.layerView4.layer.shadowOpacity = 0.5f;
    
    // 创建一个矩形阴影
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.layerView3.bounds);
    self.layerView3.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    //创建一个圆形阴影
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.layerView4.bounds);
    self.layerView4.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
    
    
}


/**
 *  图层蒙板
 */
- (void)layerMaskView
{
    /**
     *  没弄好，不想弄了
     */
    // create mask layer
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.layerView5.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"haha"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    
    //apply mask to image layer￼
    self.maskImageView.layer.mask = maskLayer;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController:[GroupOpacityViewController new] animated:YES];
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
