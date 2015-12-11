//
//  Chapter8ViewController.m
//  iOS-CoreAnimation
//
//  Created by admin on 15/12/5.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "Chapter8ViewController.h"
#import "CABasicAnimationCtrl.h"
#import "CAKeyframeAnimationCtrl.h"

@interface Chapter8ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_titleArr;
    NSArray *_chapterArr;
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation Chapter8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _titleArr = @[@"CABasicAnimation", @"CAKeyframeAnimation"];
    _chapterArr = @[
                    [[CABasicAnimationCtrl alloc] initWithTitle:_titleArr[0]],
                    [[CAKeyframeAnimationCtrl alloc] initWithTitle:_titleArr[1]],

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
