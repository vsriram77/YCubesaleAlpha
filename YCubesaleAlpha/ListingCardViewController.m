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
    //self.navigationItem.title = [NSString stringWithFormat:@"Hello %@", self.savedUserName];
    self.navigationItem.title = @"Item";
    self.navigationItem.backBarButtonItem.title = @"Back";
    
    self.view.backgroundColor = UIColorFromRGB(0x400090);

    self.fromStaticLabel.textColor = [UIColor whiteColor];
    self.priceStaticLabel.textColor = [UIColor whiteColor];
    self.catStaticLabel.textColor = [UIColor whiteColor];

    self.sdescLabel.textColor = [UIColor whiteColor];
    self.fdescLabel.textColor = [UIColor whiteColor];
    self.ynickLabel.textColor = [UIColor whiteColor];
    self.ctimeLabel.textColor = [UIColor whiteColor];
    self.catLabel.textColor = [UIColor whiteColor];
    self.cubeLabel.textColor = [UIColor whiteColor];
    self.locLabel.textColor = [UIColor whiteColor];
    self.fpriceLabel.textColor = [UIColor whiteColor];
    
    /*
    self.sdescLabel.textColor = UIColorFromRGB(0x400090);
    self.sdescLabel.backgroundColor = [UIColor whiteColor];
    self.fdescLabel.textColor = UIColorFromRGB(0x400090);
    self.fdescLabel.backgroundColor = [UIColor whiteColor];
     */

    // Do any additional setup after loading the view from its nib.
    NSLog(@"sdescData: %@ sdescLabelText: %@", self.listItem.sdesc, self.sdescLabel.text);
    self.sdescLabel.text = self.listItem.sdesc;
    self.ynickLabel.text = self.listItem.ynick;
    self.ctimeLabel.text = self.listItem.ctime;
    self.catLabel.text = self.listItem.cat;
    self.cubeLabel.text = [ NSString stringWithFormat:@"(%@)", self.listItem.cube];
    self.locLabel.text = self.listItem.loc;
    self.fpriceLabel.text = self.listItem.fprice;
    
    [self.sdescLabel setLineBreakMode: NSLineBreakByWordWrapping];
    self.sdescLabel.numberOfLines = 0;
    [self.sdescLabel sizeToFit];

    int FDESC_SUMMARY_SIZE = 250;
    NSString *fdescSummary = (self.listItem.fdesc.length > FDESC_SUMMARY_SIZE)? [ NSString stringWithFormat:@"%@ ...", [self.listItem.fdesc substringToIndex:FDESC_SUMMARY_SIZE]] : self.listItem.fdesc;
    self.fdescLabel.text = fdescSummary;
    self.fdescLabel.numberOfLines = 0;
    [self.fdescLabel sizeToFit];
    
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
    [controller setMessageBody:@"Hi\n\n -(via YCubeSale iPhone app)" isHTML:NO];
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
