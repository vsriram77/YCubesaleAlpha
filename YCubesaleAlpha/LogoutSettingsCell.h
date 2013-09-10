//
//  LogoutSettingsCell.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/10/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogoutSettingsCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *savedUserNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *savedUserIdLabel;
@property (nonatomic, weak) IBOutlet UIImageView *savedUserPicImage;
@property (nonatomic, weak) IBOutlet UIButton *logoutButton;

-(IBAction)handleLogout:(UIButton*)button;

@end
