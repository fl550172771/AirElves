//
//  ViewController.m
//  AirElves
//
//  Created by user1 on 2018/10/9.
//  Copyright © 2018年 com.HF. All rights reserved.
//

#import "ViewController.h"
#import "XLSlideMenu.h"
#import "Common.h"
#import "MainDetailViewController.h"
@interface ViewController ()<UITabBarDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigationItem];
    [self initTabbarItem];
    
    NSLog(@"---%@---",self.view.subviews);

}
-(void)initTabbarItem{
    _tabBarAdd.image = [UIImage imageNamed:@"add"];
    
    UIImage *selectedImg = [UIImage imageNamed:@"add"];
    selectedImg = [selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_tabBarAdd setSelectedImage:selectedImg];
    [_tabBarAdd setImage:selectedImg];
    _tabBarAdd.title = NSLocalizedString(@"Add Devices", nil);

    [_tabBarAdd setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      COM_COLOR, NSForegroundColorAttributeName,[NSValue valueWithUIOffset:UIOffsetMake(0,0)], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:12.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
}
-(void)initNavigationItem{
    self.navigationItem.title = @"设备列表";
    //左
    UIButton *headerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    headerButton.layer.cornerRadius = headerButton.bounds.size.width/2.0f;
    headerButton.layer.masksToBounds = true;
    [headerButton setImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
    [headerButton addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:headerButton];
}
-(void)showLeft{
    [self.xl_sldeMenu showLeftViewControllerAnimated:true];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID =@"DevList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.imageView.backgroundColor = COM_COLOR;
    cell.textLabel.text = @"设备名称";
    cell.detailTextLabel.text = @"设备mac信息";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainDetailViewController *mainDetailVC = [MainDetailViewController new];
    [self.navigationController pushViewController:mainDetailVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
