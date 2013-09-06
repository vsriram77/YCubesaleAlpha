//
//  BouncerLoginViewController.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 8/26/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BouncerLoginViewController : UIViewController {
    NSString *_savedUserId;
}

//@property (nonatomic, weak) NSString *savedUserId;
- (NSString*) savedUserId;
- (void) setSavedUserId:(NSString *)savedUserId;


@property (nonatomic, weak) IBOutlet UITextField *useridTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *cubesaleLabel;

@end
