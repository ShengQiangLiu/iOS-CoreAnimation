//
//  CATiledLayerCtrl.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "CATiledLayerCtrl.h"

@interface CATiledLayerCtrl ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation CATiledLayerCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    
    //add the tiled layer
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tileLayer.delegate = self;
    [self.scrollView.layer addSublayer:tileLayer];
    
    //configure the scroll view
    self.scrollView.contentSize = tileLayer.frame.size;
    
    /**
     *  为了防止以屏幕的原生分辨率来渲染 CATiledLayer
     */
    tileLayer.contentsScale = [UIScreen mainScreen].scale;
    
    //draw layer
    [tileLayer setNeedsDisplay];
    
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx
{
    //determine tile coordinate
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
//    NSInteger x = floor(bounds.origin.x / layer.tileSize.width);
//    NSInteger y = floor(bounds.origin.y / layer.tileSize.height);
    
    //load tile image
    UIImage *tileImage = [UIImage imageNamed:@"haha"];
    
    //draw tile
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
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
