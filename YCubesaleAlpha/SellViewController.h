//
//  SellViewController.h
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/9/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SellViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *sdescTextField;
@property (nonatomic, weak) IBOutlet UITextView *fdescTextView;
@property (nonatomic, weak) IBOutlet UITextField *fpriceTextField;
@property (nonatomic, weak) IBOutlet UIPickerView *catTextField;

-(IBAction)didTapSubmitButton:(id)sender;

@end
