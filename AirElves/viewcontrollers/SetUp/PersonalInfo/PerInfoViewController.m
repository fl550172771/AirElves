//
//  PersonalInfoViewController.m
//  HFSocket
//
//  Created by user1 on 2018/8/22.
//  Copyright © 2018年 HF. All rights reserved.
//

#import "PerInfoViewController.h"
#import "AppDelegate.h"

@interface PerInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    AppDelegate *appDelegateUtils;
    NSArray *titleArray;
}

@end

@implementation PerInfoViewController

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}
-(void)initNavigationItem{
    //左
    UIButton *headerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    [headerButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [headerButton addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:headerButton];
    
}

-(void)showLeft{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegateUtils = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self initNavigationItem];
    titleArray = @[@[@"头像",@"昵称",@"手机号"],@[@"修改登录密码",@"开启指纹解锁",@"清理缓存"],@[@"退出登录"]];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return titleArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *temp = titleArray[section];
    return temp.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 2) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 60)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        label.font = [UIFont systemFontOfSize:18];
        NSArray *temp = titleArray[indexPath.section];
        label.text =temp[indexPath.row];
        [cell.contentView addSubview:label];
        
    }else if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            NSArray *temp = titleArray[indexPath.section];
            cell.textLabel.text = temp[indexPath.row];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(tableView.bounds.size.width-90, 10, 60, 60)];
            imageView.layer.cornerRadius = 30;
            imageView.layer.masksToBounds = YES;
            imageView.backgroundColor = [UIColor lightGrayColor];
            
            [cell.contentView addSubview:imageView];
        }else{
            NSArray *temp = titleArray[indexPath.section];
            cell.textLabel.text = temp[indexPath.row];
        }
    }else{
        NSArray *temp = titleArray[indexPath.section];
        if (indexPath.row == 2) {
            cell.textLabel.text = temp[indexPath.row];
        }else{
            cell.textLabel.text = temp[indexPath.row];
        }
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 80;
        }else{
            return 50;
        }
    }else if(indexPath.section==2){
        return 60;
    }
    return 50;
}
-(void)dismissModalStack {
    UIViewController *vc = self.presentingViewController;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:NULL];
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
