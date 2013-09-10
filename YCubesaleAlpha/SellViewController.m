//
//  SellViewController.m
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/9/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import "SellViewController.h"

@interface SellViewController ()

@end

@implementation SellViewController

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
    self.navigationItem.title = @"Sell Item";
    self.navigationItem.backBarButtonItem.title = @"Back";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didTapSubmitButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

@end
