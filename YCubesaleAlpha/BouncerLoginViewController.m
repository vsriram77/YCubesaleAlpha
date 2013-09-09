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

@end


@implementation BouncerLoginViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapSignInButton:(id)sender
{
    NSString *username = self.useridTextField.text;
    NSString *password = self.passwordTextField.text;
    // AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // appDelegate.savedUserId = username;
    
    YHBKSigninService * signinService = [YHBKSigninService sharedInstance];
    [signinService signinWithUsername:username password:password success:^{
        NSLog(@"BouncerLoginViewController: didTapSignInButton YHBKSignin success for: %@", username);
        ListingsViewController *listingsController = [[ListingsViewController alloc] init];
        listingsController.savedUserId = username;
        [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"SAVED_USERID"];
        NSLog(@"BouncerLoginViewController: userid stored in UserDefaults: %@", username);
        [self.navigationController pushViewController:listingsController animated:YES];
        

    } failure:^(NSError *error){
        NSLog(@"BouncerLoginViewController: didTapSignInButton YHBKSignin failure for: %@", username);

        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Sign In Error"
                                                     message:[NSString stringWithFormat:@"%@",error]
                                                    delegate:nil
                                           cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [av show];

    }];
    
}

@end
