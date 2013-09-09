//
//  ListingCardViewController.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/7/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"



@interface ListingCardViewController : UIViewController

@property (nonatomic, weak) ListItem *listItem;

@property (nonatomic, weak) IBOutlet UILabel *sdescLabel;
@property (nonatomic, weak) IBOutlet UILabel *fdescLabel;
@property (nonatomic, weak) IBOutlet UILabel *ynickLabel;
@property (nonatomic, weak) IBOutlet UILabel *ctimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *catLabel;
@property (nonatomic, weak) IBOutlet UILabel *cubeLabel;
@property (nonatomic, weak) IBOutlet UILabel *locLabel;
@property (nonatomic, weak) IBOutlet UILabel *fpriceLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageImage;

- (IBAction) onSendEmailPress;


@end
