//
//  ListingsViewController.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListingsViewController : UITableViewController

@property (nonatomic, weak) NSString *savedUserId;
@property (nonatomic, strong) NSString *savedUserName;

-(void) fixTitleUser:(NSTimer *) timer;

@end
