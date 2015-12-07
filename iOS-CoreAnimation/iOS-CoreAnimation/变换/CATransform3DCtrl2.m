//
//  CATransform3D2.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "CATransform3DCtrl2.h"

@interface CATransform3DCtrl2 ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) NSArray *faces;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;
@property (nonatomic, strong) UILabel *label5;
@property (nonatomic, strong) UILabel *label6;
@end

@implementation CATransform3DCtrl2



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.label1.backgroundColor = [UIColor whiteColor];
    self.label1.text = @"1";
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label1.layer.borderWidth = 2;
    self.label1.font = [UIFont boldSystemFontOfSize:30];
    self.label1.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:self.label1];
    
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.label2.backgroundColor = [UIColor whiteColor];
    self.label2.text = @"2";
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label2.layer.borderWidth = 2;
    self.label2.font = [UIFont boldSystemFontOfSize:30];
    self.label2.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:self.label2];
    
    
    self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.label3.backgroundColor = [UIColor whiteColor];
    self.label3.text = @"3";
    self.label3.textAlignment = NSTextAlignmentCenter;
    self.label3.layer.borderWidth = 2;
    self.label3.font = [UIFont boldSystemFontOfSize:30];
    self.label3.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:self.label3];
    
    self.label4 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.label4.backgroundColor = [UIColor whiteColor];
    self.label4.text = @"4";
    self.label4.textAlignment = NSTextAlignmentCenter;
    self.label4.layer.borderWidth = 2;
    self.label4.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:self.label4];
    
    
    self.label5 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.label5.backgroundColor = [UIColor whiteColor];
    self.label5.text = @"5";
    self.label5.textAlignment = NSTextAlignmentCenter;
    self.label5.layer.borderWidth = 2;
    self.label5.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:self.label5];
    
    
    self.label6 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.label6.backgroundColor = [UIColor whiteColor];
    self.label6.text = @"6";
    self.label6.textAlignment = NSTextAlignmentCenter;
    self.label6.layer.borderWidth = 2;
    self.label6.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:self.label6];

    self.faces = @[self.label1, self.label2, self.label3, self.label4, self.label5, self.label6];
    
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    self.containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];
    
    
    
    
    //set up the container sublayer transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.containerView.layer.sublayerTransform = perspective;
    
    //add cube face 1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    //add cube face 2
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    //add cube face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
    

    
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    //get the face view and add it to the container
    UIView *face = self.faces[index];
    [self.containerView addSubview:face];
    //center the face view within the container
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
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
