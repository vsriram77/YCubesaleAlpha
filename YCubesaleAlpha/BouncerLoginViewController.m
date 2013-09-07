//
//  BouncerLoginViewController.m
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 8/26/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import "BouncerLoginViewController.h"
#import "YHBKSigninService.h"
#import "AFNetworking.h"
#import "ListingsViewController.h"
#import "AppDelegate.h"


@interface BouncerLoginViewController ()

- (IBAction)didTapSignInButton:(id)sender;
- (IBAction)didTapGetNameButton:(id)sender;
- (IBAction)didTapGetCubeSaleButton:(id)sender;

@end


@implementation BouncerLoginViewController

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
    NSLog(@"BouncerLoginViewController::viewDidLoad enter");
    if (! ([[self savedUserId] isEqualToString:@""])) {
        self.useridTextField.text = [self savedUserId];
    }
    [[self view] setNeedsDisplay];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapSignInButton:(id)sender
{
    self.statusLabel.text = @"Authenticating...";
    NSString *username = self.useridTextField.text;
    NSString *password = self.passwordTextField.text;
    [self setSavedUserId:username];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.savedUserId = username;
    NSLog(@"savedUserId from inside didTapSignInButton: %@", [self savedUserId]);
    
    YHBKSigninService * signinService = [YHBKSigninService sharedInstance];
    [signinService signinWithUsername:username password:password success:^{
        self.statusLabel.text = @"Authenticated";
        NSLog(@"bouncer successfullly done: %@", [self savedUserId]);
        ListingsViewController *listingsController = [[ListingsViewController alloc] init];
        listingsController.savedUserId = username;
        [self.navigationController pushViewController:listingsController animated:YES];

    } failure:^(NSError *error){ self.statusLabel.text = @"Login Error.. Try again";}];
    
}


- (IBAction)didTapGetNameButton:(id)sender
{
    
    NSLog(@"didTapGetNameButton: Enter");
    static NSString *const baseURLString = @"http://php.corp.yahoo.com/";
    NSString *userProfileJsonUrl = [NSString stringWithFormat:@"%@emp.php?query=%@&type=email", baseURLString, self.useridTextField.text];
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
                                                        NSLog(@"Name: %@", yahooName);
                                                        self.nameLabel.text = yahooName;

                                                    }
     // 4
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        NSLog(@"didTapGetNameButton: Call failed!");
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    // 5
    [operation start];
    
    
}

- (IBAction)didTapGetCubeSaleButton:(id)sender:(id)sender
{
    
    NSLog(@"didTapGetCubeSaleButton: Enter");
    static NSString *const baseURLString = @"http://cubesale.corp.yahoo.com/";
    NSURLRequest *request = [NSURLRequest requestWithURL:baseURLString];
    
    NSLog(@"didTapGetCubeSaleButton: before Request");
    // 2
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
     // 3
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        NSLog(@"didTapGetCubeSaleButton: Call successful!");
                                                        NSDictionary *dict  = (NSDictionary *)JSON;
                                                        NSArray *yahoos = (NSArray*)[dict valueForKey:@"yahoos"];
                                                        NSDictionary *aYahoo = [yahoos objectAtIndex: 0];
                                                        NSString *yahooName =  (NSString*)[aYahoo valueForKey:@"yfirst"];
                                                        NSLog(@"Name: %@", yahooName);
                                                        self.nameLabel.text = yahooName;
                                                        ListingsViewController *listingsController = [[ListingsViewController alloc] init];
                                                        
                                                        //[listingsController setSavedUserId:self.savedUserId];
                                                        //[listingsController setSavedName:yahooName];
                                                        
                                                        [self.navigationController pushViewController:listingsController animated:YES];

                                                    }
     // 4
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        NSLog(@"didTapGetCubeSaleButton: Call failed!");
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    // 5
    [operation start];
    
    
}

@end
