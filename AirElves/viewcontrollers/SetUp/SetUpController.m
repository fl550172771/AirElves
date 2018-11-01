//
//  SetUpController.m
//  HFSocket
//
//  Created by Pishum on 15/8/5.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "SetUpController.h"
#import "SetUpCellView.h"
#import "MSAlertController.h"
#import <AudioToolbox/AudioToolbox.h>
//#import "FeedBackController.h"
@interface SetUpController ()<UITableViewDataSource,UITableViewDelegate>
{
    AppDelegate *appDelegateUtils;
}

@property (strong,nonatomic)NSMutableArray *tableViewData;
@property (strong,nonatomic)NSString *currentLanguage;

@end

//BOOL isVoiceSwitchOn;
//BOOL isShakeSwitchOn;

@implementation SetUpController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appDelegateUtils = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self initNavigationItem];
    [self initUtils];
    [self initTableViewDataInfos];
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
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}
- (void)initUtils{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *string = [userDefaults valueForKey:@"language_key"];
    if (string != nil) {
        if ([string isEqualToString:@"zh-Hans"]) {
            string = @"中文";
        }else if ([string isEqualToString:@"ko"]){
            string = @"한국어";
        }else if ([string isEqualToString:@"en"]){
            string = @"English";
        }else if ([string isEqualToString:@"zh-Hant"]){
            string = @"中文繁体";
        }
    }
    
    self.currentLanguage = string;
    self.navigationItem.title = NSLocalizedString(@"Setup", nil);
//    UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
//    temporaryBarButtonItem.title= NSLocalizedString(@"Setup", nil);
//    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
}

- (void)initTableViewDataInfos{
    
    self.tableViewData = [[NSMutableArray alloc]init];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"SetUpInfo" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    
    NSArray *array1 = [data objectForKey:@"Group1"];
    NSArray *array2 = [data objectForKey:@"Group2"];
//    NSArray *array3 = [data objectForKey:@"Group3"];
//    NSArray *array4 = [data objectForKey:@"Group4"];
//    NSArray *array5 = [data objectForKey:@"Group5"];
    
    [self.tableViewData addObject:array1];
    [self.tableViewData addObject:array2];
//    [self.tableViewData addObject:array3];
//    [self.tableViewData addObject:array4];
//    [self.tableViewData addObject:array5];
    
}


/************tableView--*************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.tableViewData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableViewData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section != 5) {
        static NSString *simpleIdent = @"SetUpCellView";
        SetUpCellView *cell = (SetUpCellView*)[self.setupTableView dequeueReusableCellWithIdentifier:simpleIdent];
        if (cell != nil) {
            NSDictionary *dict = self.tableViewData[indexPath.section][indexPath.row];
            NSString *iconName = [dict objectForKey:@"text_icon"];
            NSString *labelName = [dict objectForKey:@"text_label"];
            cell.cellIcon.image = [UIImage imageNamed:iconName];
            cell.cellLabel.text = NSLocalizedString(labelName, nil);
            if (indexPath.section == 0 ) {//声音，振动
                [cell.cellSwitch setHidden:NO];
                [cell.cellInfo setHidden:YES];
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                BOOL isVoiceSwitchOn = [(NSNumber*)[userDefaults valueForKey:@"voice_key"]boolValue];
                BOOL isShakeSwitchOn = [(NSNumber*)[userDefaults valueForKey:@"shake_key"]boolValue];
                if (indexPath.row == 0) {
                    cell.cellSwitch.on = isVoiceSwitchOn;
                    [cell.cellSwitch setTag:0];
                }else if (indexPath.row == 1){
                    cell.cellSwitch.on = isShakeSwitchOn;
                    [cell.cellSwitch setTag:1];
                }
            }else if (indexPath.section == 1){//语言
                [cell.cellSwitch setHidden:YES];
                [cell.cellInfo setHidden:NO];
                cell.cellInfo.text = self.currentLanguage;
            }else{
                [cell.cellSwitch setHidden:YES];
                [cell.cellInfo setHidden:YES];
            }
        }
        return cell;
//    }
//    else{
//        UITableViewCell *cell = [self.setupTableView dequeueReusableCellWithIdentifier:@"cellID"];
//        if (cell == nil) {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
//        }
//        UILabel *logOut = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.rowHeight)];
//        logOut.backgroundColor = [UIColor redColor];
//        logOut.textColor = [UIColor whiteColor];
//        logOut.font = [UIFont systemFontOfSize:22.0f];
//        logOut.textAlignment = NSTextAlignmentCenter;
//        logOut.text = @"退 出 登 录";
//        [cell addSubview:logOut];
//        return cell;
//    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SetUpCellView *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
        {
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            BOOL isVoiceSwitchOn = [(NSNumber*)[userDefaults valueForKey:@"voice_key"]boolValue];
            BOOL isShakeSwitchOn = [(NSNumber*)[userDefaults valueForKey:@"shake_key"]boolValue];
            switch (indexPath.row) {
                case 0:
                    isVoiceSwitchOn = !isVoiceSwitchOn;
                    cell.cellSwitch.on = isVoiceSwitchOn;
                    [userDefaults  setValue:[NSNumber numberWithBool:isVoiceSwitchOn] forKey:@"voice_key"];
//                    AudioServicesPlaySystemSound(1075);
                    [SetUpController soundAndVibrate];
                    [userDefaults setValue:[NSNumber numberWithBool:isVoiceSwitchOn] forKey:@"voice_key"];
                    break;
                case 1:
                    isShakeSwitchOn = !isShakeSwitchOn;
                    cell.cellSwitch.on = isShakeSwitchOn;
                    [userDefaults  setValue:[NSNumber numberWithBool:isShakeSwitchOn] forKey:@"shake_key"];
//                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                    [SetUpController soundAndVibrate];
                    [userDefaults setValue:[NSNumber numberWithBool:isShakeSwitchOn] forKey:@"shake_key"];
                    break;
                default:
                    break;
            }
        }
            break;
        case 1://language
            [self selectLanguage];
            break;
        case 2://help
            
            break;
        case 3://feedback FeedBackController
        {
//            UIStoryboard *stroy = [UIStoryboard storyboardWithName:@"FeedBackController" bundle:nil];
//            FeedBackController *feedVC = [stroy  instantiateViewControllerWithIdentifier:@"FeedBackController"];
//            [self.navigationController pushViewController:feedVC animated:YES];
            

        }            break;
        case 4://About
           
            break;
        case 5:
//            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        default:
            break;
    }
    //当手指离开某行时，就让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)selectLanguage{
    MSAlertController *alertController = [MSAlertController alertControllerWithTitle:NSLocalizedString(@"More Option", nil) message:nil AlertTag:[NSNumber numberWithInt:100] preferredStyle:MSAlertControllerStyleActionSheet];
    MSAlertAction *action = [MSAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:MSAlertActionStyleCancel handler:^(MSAlertAction *action) {
    }];
    [alertController addAction:action];
    
    MSAlertAction *action1 = [MSAlertAction actionWithTitle:@"中文" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
//        appDelegateUtils.language = @"zh-Hans";
//        appDelegateUtils.sendLanguage = @"zh_cn";
//        [AppDelegate setUserlanguage:@"zh-Hans"];
        [self RefreshSetupView];
    }];
    [alertController addAction:action1];
    
    MSAlertAction *action1_ = [MSAlertAction actionWithTitle:@"中文繁體" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
//        appDelegateUtils.language = @"zh-Hant";
//        appDelegateUtils.sendLanguage = @"zh_cn";
//        [AppDelegate setUserlanguage:@"zh-Hant"];
        [self RefreshSetupView];
    }];
    [alertController addAction:action1_];
    
    MSAlertAction *action2 = [MSAlertAction actionWithTitle:@"한국어" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
//        appDelegateUtils.language = @"ko";
//        appDelegateUtils.sendLanguage = @"en";
//        [AppDelegate setUserlanguage:@"ko"];
        [self RefreshSetupView];
    }];
    [alertController addAction:action2];
    
    MSAlertAction *action3 = [MSAlertAction actionWithTitle:@"English" style:MSAlertActionStyleDefault handler:^(MSAlertAction *action) {
//        appDelegateUtils.language = @"en";
//        appDelegateUtils.sendLanguage = @"en";
//        [AppDelegate setUserlanguage:@"en"];
        [self RefreshSetupView];
    }];
    [alertController addAction:action3];
    [self presentViewController:alertController animated:NO completion:nil];
    
    
}

- (void)RefreshSetupView{
    [self.navigationController popToRootViewControllerAnimated:YES];
}



+ (void)soundAndVibrate{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    BOOL voiceOn = [(NSNumber*)[def valueForKey:@"voice_key"]boolValue];
    BOOL shakeOn = [(NSNumber*)[def valueForKey:@"shake_key"]boolValue];
    
    if (voiceOn) {
        AudioServicesPlaySystemSound(1075);
    }
    
    if (shakeOn) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}
@end
