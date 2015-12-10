//
//  CAScrollLayerCtrl.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "CAScrollLayerCtrl.h"
#import "CAScrollLayerView.h"

@interface CAScrollLayerCtrl ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation CAScrollLayerCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clock"]];
    
    
    CAScrollLayerView *scrollLayer = [[CAScrollLayerView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    scrollLayer.backgroundColor = [UIColor whiteColor];
    [scrollLayer addSubview:self.imageView];
    [self.view addSubview:scrollLayer];
    
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
