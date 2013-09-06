//
//  WelcomeViewController.m
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import "WelcomeViewController.h"
#import "AFNetworking.h"
#import "ListingsViewController.h"


@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (NSString*) savedUserId {
    
    return _savedUserId;
}

- (void) setSavedUserId:(NSString *)savedUserId
{
    _savedUserId = savedUserId;
}


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
    self.userIdLabel.text = self.savedUserId;
    NSLog(@"didTapGetNameButton: Enter");
    static NSString *const baseURLString = @"http://php.corp.yahoo.com/";
    NSString *userProfileJsonUrl = [NSString stringWithFormat:@"%@emp.php?query=%@&type=email", baseURLString, self.savedUserId];
    NSURL *url = [NSURL URLWithString:userProfileJsonUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSLog(@"didTapGetNameButton: before Request");
    // 2
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
     // 3
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        NSLog(@"didTapGetNameButton: Call successful!");
                                                        NSDictionary *dict  = (NSDictionary *)JSON;
                                                        NSArray *yahoos = (NSArray*)[dict valueForKey:@"yahoos"];
                                                        NSDictionary *aYahoo = [yahoos objectAtIndex: 0];
                                                        NSString *yahooName =  (NSString*)[aYahoo valueForKey:@"yfirst"];
                                                        NSLog(@"Namennnn: %@", yahooName);
                                                        self.userIdLabel.text = yahooName;
                                                        ListingsViewController *listingsController = [[ListingsViewController alloc] init];
                                                        //[listingsController setSavedUserId:self.savedUserId];
                                                        //[listingsController setSavedName:yahooName];
                                                        
                                                        [self.navigationController pushViewController:listingsController animated:YES];

                                                    }
     // 4
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        NSLog(@"didTapGetNameButton: Call failed!");
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error logging in"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                        self.userIdLabel.text = @"error!";

                                                    }];
    
    // 5
    [operation start];
    
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
