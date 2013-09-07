//
//  ListItemCell.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListItemCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *sdescLabel;
@property (nonatomic, weak) IBOutlet UILabel *ctimeLabel;

- (IBAction)onTapTableCell;

@end
