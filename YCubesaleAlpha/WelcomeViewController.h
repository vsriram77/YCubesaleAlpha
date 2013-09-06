//
//  WelcomeViewController.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController {
    NSString *_savedUserId;
}

//@property (nonatomic, weak) NSString *savedUserId;
- (NSString*) savedUserId;
- (void) setSavedUserId:(NSString *)savedUserId;

@property (nonatomic, weak) IBOutlet UILabel *userIdLabel;

@end
