//
//  SceneSetViewController.m
//  AirElves
//
//  Created by user1 on 2018/10/10.
//  Copyright © 2018年 com.HF. All rights reserved.
//

#import "SceneSetViewController.h"

@interface SceneSetViewController ()

@end

@implementation SceneSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationItem];
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
