//
//  Chapter1ViewController.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "Chapter1ViewController.h"

@interface Chapter1ViewController ()
@property (nonatomic, strong) UIView *layerView;
@end

@implementation Chapter1ViewController

/**
 *  UIView 和 CALayer
 UIView：
 在iOS当中，所有的视图都从一个叫做UIVIew的基类派生而来，UIView可以处理触摸事件，可以支持基于Core Graphics绘图，可以做仿射变换（例如旋转或者缩放），或者简单的类似于滑动或者渐变的动画。
 CALayer：
 CALayer类在概念上和UIView类似，同样也是一些被层级关系树管理的矩形块，同样也可以包含一些内容（像图片，文本或者背景色），管理子图层的位置。它们有一些方法和属性用来做动画和变换。和UIView最大的不同是CALayer不处理用户的交互。
 CALayer并不清楚具体的响应链（iOS通过视图层级关系用来传送触摸事件的机制），于是它并不能够响应事件，即使它提供了一些方法来判断是否一个触点在图层的范围之内（具体见第三章，“图层的几何学”）
 
 平行的层级关系：
 实际上这些背后关联的图层才是真正用来在屏幕上显示和做动画，UIView仅仅是对它的一个封装，提供了一些iOS类似于处理触摸的具体功能，以及Core Animation底层方法的高级接口。
 
 CALayer的功能：
 
 阴影，圆角，带颜色的边框
 3D变换
 非矩形范围
 透明遮罩
 多级非线性动画
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.layerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView];
    
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 50, 50);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:blueLayer];
    
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
