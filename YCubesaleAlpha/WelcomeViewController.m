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
    NSLog(@"WelcomeViewController: viewDidLoad Enter");

    self.userIdLabel.text = self.savedUserId;

    if ([self.savedUserId isEqualToString:@""]) {
        BouncerLoginViewController *bouncerViewController = [[ BouncerLoginViewController alloc] init];

        [self.navigationController pushViewController:bouncerViewController animated:YES];
        return;
    }
    
    static NSString *const baseURLString = @"http://bug.corp.yahoo.com/";
    NSURL *url = [NSURL URLWithString:baseURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"WelcomeViewController: before Request");
    // 2
    AFHTTPRequestOperation *operation =
    [[AFHTTPRequestOperation alloc] initWithRequest:request ];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"WelcomeViewController: request success");
        
        ListingsViewController *listingsController = [[ListingsViewController alloc] init];
        listingsController.savedUserId = self.savedUserId;
        [self.navigationController pushViewController:listingsController animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"WelcomeViewController: request failed");
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Sign In Error"
                                                     message:[NSString stringWithFormat:@"%@",error]
                                                    delegate:nil
                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [av show];
        self.userIdLabel.text = @"error!";
    }];
    
    [operation start];
    
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
