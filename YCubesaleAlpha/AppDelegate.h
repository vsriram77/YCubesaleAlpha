//
//  AppDelegate.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 8/26/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BouncerLoginViewController.h"
#import "WelcomeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WelcomeViewController *welcomeViewController;
@property (strong, nonatomic) NSString *savedUserId;


@end
