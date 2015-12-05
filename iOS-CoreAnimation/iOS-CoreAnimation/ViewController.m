//
//  ViewController.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "ViewController.h"
#import "Chapter1ViewController.h"
#import "Chapter2ViewController.h"
#import "Chapter3ViewController.h"
#import "Chapter4ViewController.h"
#import "Chapter5ViewController.h"
#import "Chapter6ViewController.h"
#import "Chapter7ViewController.h"
#import "Chapter8ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_titleArr;
    NSArray *_chapterArr;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Core Animation";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _titleArr = @[@"图层树", @"寄宿图", @"图层几何学", @"视觉效果", @"变换", @"专用图层", @"隐式动画", @"显式动画"];
    _chapterArr = @[
                    [[Chapter1ViewController alloc] initWithTitle:_titleArr[0]],
                    [[Chapter2ViewController alloc] initWithTitle:_titleArr[1]],
                    [[Chapter3ViewController alloc] initWithTitle:_titleArr[2]],
                    [[Chapter4ViewController alloc] initWithTitle:_titleArr[3]],
                    [[Chapter5ViewController alloc] initWithTitle:_titleArr[4]],
                    [[Chapter6ViewController alloc] initWithTitle:_titleArr[5]],
                    [[Chapter7ViewController alloc] initWithTitle:_titleArr[6]],
                    [[Chapter8ViewController alloc] initWithTitle:_titleArr[7]],
                    ];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [UIView new];

    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.frame;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.text = _titleArr[indexPath.row];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
        imageView.image = [UIImage imageNamed:@"右箭头"];
        cell.accessoryView = imageView;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:_chapterArr[indexPath.row] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
