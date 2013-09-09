//
//  ListingCardViewController.m
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/7/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import "ListingCardViewController.h"
#import "AFNetworking.h"
#import "MessageUI/MFMailComposeViewController.h"


@interface ListingCardViewController ()
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;

@end

@implementation ListingCardViewController
@synthesize listItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"sdescData: %@ sdescLabelText: %@", self.listItem.sdesc, self.sdescLabel.text);
    self.sdescLabel.text = self.listItem.sdesc;
    self.fdescLabel.text = self.listItem.fdesc;
    self.ynickLabel.text = self.listItem.ynick;
    self.ctimeLabel.text = self.listItem.ctime;
    self.catLabel.text = self.listItem.cat;
    self.cubeLabel.text = self.listItem.cube;
    self.locLabel.text = self.listItem.loc;
    self.fpriceLabel.text = self.listItem.fprice;
    //self.sdescLabel.text = self.listItem.image;
    NSURL *url = [NSURL URLWithString:self.listItem.image ];
    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    [self.imageImage setImage:image];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onSendEmailPress
{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject: [NSString stringWithFormat:@"[YCubeSale] Interested in %@", self.listItem.sdesc]];
    [controller setMessageBody:@"Hi\n\n -(auto generated from YCubeSale)" isHTML:NO];
    NSMutableArray * recipients = [[NSMutableArray alloc] init];
    NSArray *toRecipients = [NSArray arrayWithObject: [NSString stringWithFormat:@"%@@yahoo-inc.com", self.listItem.ynick]];
    [controller setToRecipients:toRecipients];
    if (controller) [self presentModalViewController:controller animated:YES];
}


- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Mail sent!"
                                                     message:[NSString stringWithFormat:@"Mail sent to %@", self.listItem.ynick]
                                                    delegate:nil
                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [av show];

        
        
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end
