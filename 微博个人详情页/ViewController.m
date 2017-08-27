//
//  ViewController.m
//  微博个人详情页
//
//  Created by apple on 2017/8/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"

#define  WJHeaderViewH 200
#define WJTabBarH 44

#define WJHeadViewMinH 64

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, assign) CGFloat oriOffsetY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headHeightCons;
@property(nonatomic, weak) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tableView的数据源和代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //设置导航条
    [self setupNavigationBar];
    
    //不需要添加额外的区域
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //先记录开始的偏移量
    _oriOffsetY = -(WJHeaderViewH + WJTabBarH);
    
    // 设置tableView顶部额外滚动区域
    self.tableView.contentInset = UIEdgeInsetsMake(WJHeaderViewH + WJTabBarH, 0, 0, 0);
    
    
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
    _label = label;
    
    
    label.textColor = [UIColor colorWithWhite:1 alpha:0];
    
    
    
    
    //设置透明度
    //    label.alpha = 0;
    
    //尺寸自适应：会自动计算文字大小
    [label sizeToFit];
    
    [self.navigationItem setTitleView:label];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 20;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//滚动tableview的时候就会调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    //1.计算下tableView滚动了多少
    
    
    //获取当前偏移量y值
    CGFloat curOffsetY= scrollView.contentOffset.y;
    

    //计算偏移量的差值 == tableView滚动了多少
    
    //偏移量：tableview内容与可视范围的偏移量
    
    
    //2.获取当前滚动偏移量 - 最开始的偏移量-244
    CGFloat delta = curOffsetY - _oriOffsetY;
    
    // 计算下头部视图的高度
    CGFloat h = WJHeaderViewH - delta;
    
    if (h < WJHeadViewMinH) {
        h = WJHeadViewMinH;
    }
    
    //修改头部视图高度，有视觉差效果
    _headHeightCons.constant = h;
    
    //处理导航条业务逻辑
    
    //计算透明度
    CGFloat alpha = delta / (WJHeaderViewH -WJHeadViewMinH);
    
    if (alpha > 1) {
        alpha = 0.99;
    }
    NSLog(@"%f",delta);
    
    NSLog(@"%f",alpha);

    //设置导航条背景图片
    //生成当前alpha值生成一张图片
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    _label.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
    
    
}

@end
