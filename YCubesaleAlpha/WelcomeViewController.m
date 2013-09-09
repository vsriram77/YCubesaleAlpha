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
#import "BouncerLoginViewController.h"

@implementation WelcomeViewController

@synthesize savedUserId;


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
    NSLog(@"WelcomeViewController: viewDidLoad Enter");
    // [NSThread sleepForTimeInterval:3];
    
    if ((self.savedUserId == nil) || [self.savedUserId isEqualToString:@""]) {
        BouncerLoginViewController *bouncerViewController = [[ BouncerLoginViewController alloc] init];
        [self.navigationController pushViewController:bouncerViewController animated:YES];
        return;
    }
    
    static NSString *const urlString = @"http://bug.corp.yahoo.com/";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"WelcomeViewController: cookie validity probe: before");

    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request ];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"WelcomeViewController: cookie validity probe: success");
        
        ListingsViewController *listingsController = [[ListingsViewController alloc] init];
        listingsController.savedUserId = self.savedUserId;
        [self.navigationController pushViewController:listingsController animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"WelcomeViewController: cookie validity probe: failure");
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Sign In Error"
                                                     message:[NSString stringWithFormat:@"%@",error]
                                                    delegate:nil
                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [av show];
        BouncerLoginViewController *bouncerViewController = [[ BouncerLoginViewController alloc] init];
        [self.navigationController pushViewController:bouncerViewController animated:YES];

    }];
    
    [operation start];
    
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
