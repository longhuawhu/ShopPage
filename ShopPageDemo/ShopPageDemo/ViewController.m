//
//  ViewController.m
//  ShopPageDemo
//
//  Created by lh on 16/5/16.
//  Copyright © 2016年 Lh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIView *topView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    
    self.tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0);
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, -300, self.view.bounds.size.width, 300)];
    topView.backgroundColor = [UIColor orangeColor];
    [self.tableView addSubview:topView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGPoint ponint = scrollView.contentOffset;
    NSLog(@"%f", ponint.y);
    
    if (ponint.y > -364) {
        self.tableView.contentInset =  UIEdgeInsetsMake(300, 0, 0, 0);
    }
    else {
        CGFloat top = ponint.y + 364 + 300;
        self.tableView.contentInset =  UIEdgeInsetsMake(top, 0, 0, 0);
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
}

@end
