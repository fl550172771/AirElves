//
//  AppDelegate.m
//  AirElves
//
//  Created by user1 on 2018/10/9.
//  Copyright © 2018年 com.HF. All rights reserved.
//

#import "AppDelegate.h"
#import "XLSlideMenu.h"
#import "ViewController.h"
#import "PersonalsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initRootView];
    return YES;
}
-(void)initRootView{
    //创建滑动菜单
    //主界面
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ViewController *vc = [storyboard instantiateInitialViewController];
    //配置NavigationBar
    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:vc];
    [rootNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarBackImage"] forBarMetrics:UIBarMetricsDefault];
    rootNav.navigationBar.tintColor = [UIColor whiteColor];
    [rootNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    PersonalsViewController *leftVC = [[PersonalsViewController alloc]initWithNibName:@"PersonalsViewController" bundle:[NSBundle mainBundle]];
    XLSlideMenu *slideMenu = [[XLSlideMenu alloc] initWithRootViewController:rootNav];
    //设置左右菜单
    slideMenu.leftViewController = leftVC;
    self.window.rootViewController = slideMenu;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
