//
//  Chapter2ViewController.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "Chapter2ViewController.h"

@interface Chapter2ViewController ()
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) UIView *layerView2;

@end

@implementation Chapter2ViewController

/**
 * 相关知识
 */
/**
 *  iOS使用了以下的坐标系统：
 
 点 —— 在iOS和Mac OS中最常见的坐标体系。点就像是虚拟的像素，也被称作逻辑像素。在标准设备上，一个点就是一个像素，但是在Retina设备上，一个点等于2*2个像素。iOS用点作为屏幕的坐标测算体系就是为了在Retina设备和普通设备上能有一致的视觉效果。
 像素 —— 物理像素坐标并不会用来屏幕布局，但是仍然与图片有相对关系。UIImage是一个屏幕分辨率解决方案，所以指定点来度量大小。但是一些底层的图片表示如CGImage就会使用像素，所以你要清楚在Retina设备和普通设备上，他们表现出来了不同的大小。
 单位 —— 对于与图片大小或是图层边界相关的显示，单位坐标是一个方便的度量方式， 当大小改变的时候，也不需要再次调整。单位坐标在OpenGL这种纹理坐标系统中用得很多，Core Animation中也用到了单位坐标。

 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    self.layerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView];
    
    
    UIImage *image = [UIImage imageNamed:@"haha"];
    /**
     *
     *
     */
    self.layerView.layer.contents =   (__bridge id)image.CGImage;
    
    /**
     *  contentsGravity
     *  对应 UIView 里面的 contentMode
     */
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    
    /**
     *  contentsScale
     *  当用代码的方式来处理寄宿图的时候，一定要记住要手动的设置图层的contentsScale属性，否则，你的图片在Retina设备上就显示得不正确啦
     */
    self.layerView.layer.contentsScale = image.scale;
    
    
    /**
     *  maskToBounds
     *  如果超过边界，可以使用 masksToBounds来修建图层内容。UIView有一个叫做clipsToBounds的属性可以用来决定是否显示超出边界的内容。
     */
    self.layerView.layer.masksToBounds = YES;
    
    /**
     *  contentsRect
     *  contentsRect属性允许我们在图层边框里显示寄宿图的一个子域
     *  contentsRect不是按点来计算的，它使用了单位坐标，单位坐标指定在0到1之间，是一个相对值（像素和点就是绝对值）
     *
     */
    self.layerView.layer.contentsRect = CGRectMake(0, 0, 1, 1);
    
    /**
     *  contentsCenter
     *  contentsCenter其实是一个CGRect，定义了一个固定的边框和一个在图层上可拉伸的区域
     *  改变contentsCenter的值并不会影响到寄宿图的显示，除非这个图层的大小改变了，你才看得到效果。
     *  由conttensGravity 决定寄宿图的拉伸
     */
    self.layerView.layer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5);
    
    
    
    [self customDrawing];
    
}


/**
 *  自定义绘制
 */
- (void)customDrawing
{
    self.layerView2 = [[UIView alloc] initWithFrame:CGRectMake(50.0f, 320.0f, 200.0f, 200.0f)];
    self.layerView2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView2];
    
    //create sublayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    /**
     *  CALayerDelegate是一个非正式协议，其实就是说没有CALayerDelegate @protocol可以让你在类里面引用啦。
     *   你只需要调用你想调用的方法，CALayer会帮你做剩下的。（delegate属性被声明为id类型，所有的代理方法都是可选的）。
     */
    //set controller as layer delegate
    blueLayer.delegate = self;
    
    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
    [self.layerView2.layer addSublayer:blueLayer];
    
    //force layer to redraw
    [blueLayer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
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
