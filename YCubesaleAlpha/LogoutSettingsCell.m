//
//  LogoutSettingsCell.m
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/10/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import "LogoutSettingsCell.h"
#import "BouncerLoginViewController.h"

@implementation LogoutSettingsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.logoutButton addTarget:self action:@selector(handleLogout) forControlEvents:UIControlEventTouchDown];
        self.logoutButton.tag = 10;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)handleLogout:(UIButton*)button
{
    NSLog(@"indexPath.row value : %d", button.tag);
    BouncerLoginViewController *bouncerViewController = [[ BouncerLoginViewController alloc] init];
    //[self.navigationController pushViewController:bouncerViewController animated:YES];

}

@end
