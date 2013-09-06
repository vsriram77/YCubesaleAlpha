//
//  ListingsViewController.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListingsViewController : UITableViewController {
    NSString *_savedUserId;
    NSString *_savedName;
}

//@property (nonatomic, weak) NSString *savedUserId;
- (NSString*) savedUserId;
- (void) setSavedUserId:(NSString *)savedUserId;
- (NSString*) savedName;
- (void) setSavedName:(NSString *)savedName;



@end
