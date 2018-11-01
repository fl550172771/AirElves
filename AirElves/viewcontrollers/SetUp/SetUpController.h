//
//  SetUpController.h
//  HFSocket
//
//  Created by Pishum on 15/8/5.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SetUpController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *setupTableView;


//+ (BOOL)VoiceSwitchOn;
//+ (BOOL)ShakeSwitchOn;

+ (void)soundAndVibrate;
@end
