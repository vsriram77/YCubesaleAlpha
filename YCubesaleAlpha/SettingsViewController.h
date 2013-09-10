//
//  SettingsViewController.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/9/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController

@property (nonatomic, strong) NSString *savedUserName;
@property (nonatomic, strong) NSString *savedUserId;

-(IBAction)didTapLogoutButton:(id)sender;
@end
