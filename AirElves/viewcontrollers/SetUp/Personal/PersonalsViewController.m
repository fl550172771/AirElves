//
//  PersonalViewController.m
//  HFSocket
//
//  Created by user1 on 2018/8/22.
//  Copyright © 2018年 HF. All rights reserved.
//

#import "PersonalsViewController.h"
#import "AppDelegate.h"
#import "SetUpController.h"
#import "NickTableViewCell.h"
#import "PerInfoViewController.h"
#import "SceneSetViewController.h"
@interface PersonalsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    AppDelegate *appDelegateUtils;
    
    NSArray *titleArray;
    NSArray *iconArray;
    NSString *perCenter;
    NSString *setNick;
}
@end

@implementation PersonalsViewController

- (IBAction)setUpBtnClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SetUpController *setup = [storyboard instantiateViewControllerWithIdentifier:@"SetUpConfigs"];
    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:setup];
    [rootNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarBackImage"] forBarMetrics:UIBarMetricsDefault];
    rootNav.navigationBar.tintColor = [UIColor whiteColor];
    [rootNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    [self presentViewController:rootNav animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegateUtils = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    titleArray = @[NSLocalizedString(@"第三方接入", nil),NSLocalizedString(@"场景设置", nil),NSLocalizedString(@"帮助", nil),NSLocalizedString(@"意见反馈", nil),NSLocalizedString(@"关于我们", nil)];
    iconArray = @[@"third",@"about",@"help",@"feedback",@"about"];
    self.mainTableList.tableFooterView = [[UIView alloc]init];
    [self.mainTableList registerNib:[UINib nibWithNibName:@"NickTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"nickCell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return titleArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    if (indexPath.section == 0) {
        NickTableViewCell *cell = [[NSBundle mainBundle] loadNibNamed:@"NickTableViewCell" owner:nil options:nil][0];
        cell.nickTitleLabel.text = @"昵称";
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = titleArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:iconArray[indexPath.row]];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        if (indexPath.section == 0) {
            PerInfoViewController *perInfoVC = [PerInfoViewController new];
            UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:perInfoVC];
            [rootNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarBackImage"] forBarMetrics:UIBarMetricsDefault];
            rootNav.navigationBar.tintColor = [UIColor whiteColor];
            [rootNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
            [self presentViewController:rootNav animated:YES completion:nil];
        }else{
            if (indexPath.row == 1) {
                SceneSetViewController *senceSetVC = [SceneSetViewController new];
                UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:senceSetVC];
                [rootNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarBackImage"] forBarMetrics:UIBarMetricsDefault];
                rootNav.navigationBar.tintColor = [UIColor whiteColor];
                [rootNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
                [self presentViewController:rootNav animated:YES completion:nil];
            }
        }
//        else{
    //        if (indexPath.row == 0) { //第三方接入
    //            [self performSegueWithIdentifier:@"ThirdPartyViewController" sender:self];
    //        }else if(indexPath.row == 1){
    //            [self performSegueWithIdentifier:@"HelpInfoController" sender:self];
    //        }else if (indexPath.row == 2){
    //            [self performSegueWithIdentifier:@"FeedBackController" sender:self];
    //        }else if(indexPath.row == 3){
    //             [self performSegueWithIdentifier:@"AboutController" sender:self];
    //        }
    //    }
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
