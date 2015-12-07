//
//  CATransform3D.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "CATransform3DCtrl.h"

@interface CATransform3DCtrl ()
@property (nonatomic, strong) UIImageView *layerView;
@property (nonatomic, strong) UIImageView *layerView2;

@end

@implementation CATransform3DCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layerView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    self.layerView.image = [UIImage imageNamed:@"haha"];
    [self.view addSubview:self.layerView];
    
    self.layerView2 = [[UIImageView alloc] initWithFrame:CGRectMake(250, 100, 100, 100)];
    self.layerView2.image = [UIImage imageNamed:@"haha"];
    [self.view addSubview:self.layerView2];
    
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    // CATransform3D的m34元素，用来做透视
    // m34的默认值是0，我们可以通过设置m34为-1.0 / d来应用透视效果，d代表了想象中视角相机和屏幕之间的距离，以像素为单位
    transform.m34 = -1.0 / 1000.0;
    self.layerView.layer.transform = transform;
    
    
    //rotate layerView2 by 45 degrees along the Y axis
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = transform2;
    
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    self.view.layer.sublayerTransform = perspective;
    
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
