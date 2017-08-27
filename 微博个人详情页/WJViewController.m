//
//  WJViewController.m
//  微博个人详情页
//
//  Created by apple on 2017/8/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WJViewController.h"

@interface WJViewController ()

@end

@implementation WJViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(2000, 2000, 0, 200)];
    headView.backgroundColor = [UIColor blueColor];
    
    //设置tableview头部视图
    self.tableView.tableHeaderView = headView;
    
    //tableView才有这个功能，只要设置tableView顶部额外滚动区域，就会往下边挤
    
    //iOS7之后，苹果会自动给导航控制器里面的所有UIScrollView顶部都会添加额外的滚动区域64.
    
    //设置不需要添加额外的滚动区域
    self.automaticallyAdjustsScrollViewInsets = NO;

    //设置导航条
    [self setupNavigationBar];
    
}


//设置导航条
-(void)setupNavigationBar
{

    
    //设置导航条背景为透明
    //UIBarMetricsDefault这个模式，才能设置导航栏的背景图片
    //传递一个空的UIImage
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    
    //清空导航栏的阴影
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
    //设置标题为透明
    UILabel *label = [[UILabel alloc] init];
    label.text = @"22";
    
    label.textColor = [UIColor colorWithWhite:1 alpha:0];
    
    
    
    
    //设置透明度
    //    label.alpha = 0;
    
    //尺寸自适应：会自动计算文字大小
    [label sizeToFit];
    
    [self.navigationItem setTitleView:label];
    

}


-(void)viewDidAppear:(BOOL)animated
{

    [super viewDidAppear:animated];
    NSLog(@"%f",self.tableView.contentInset.top);

//    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
