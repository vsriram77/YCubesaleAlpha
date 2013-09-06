//
//  ListingsViewController.m
//  YCubesaleAlpha
//
//  Created by Sriram Varadarajan on 9/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\vsriram. All rights reserved.
//

#import "ListingsViewController.h"
#import "AFNetworking.h"
#import "ListItemCell.h"
#import "ListItem.h"


@interface ListingsViewController ()

@property (nonatomic, strong) NSMutableArray *listItems;

@end

@implementation ListingsViewController

/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    NSLog(@"%@", @"TimelineVC:initWithStyle called...");
    
    if (self) {
        self.title = self.savedName;
        NSLog(@"%@", @"TimelineVC:initWithStyle about to call reload...");
        
    }
    return self;
}
*/


- (NSString*) savedUserId {
    
    return _savedUserId;
}

- (void) setSavedUserId:(NSString *)savedUserId
{
    _savedUserId = savedUserId;
}

- (NSString*) savedName {
    
    return _savedName;
}

- (void) setSavedName:(NSString *)savedName
{
    _savedUserId = savedName;
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
    NSLog(@"ListingsViewController: viewDidLoad enter");

    // Do any additional setup after loading the view from its nib.
    //self.userIdLabel.text = self.savedUserId;
    //self.nameLabel.text = self.savedName;
    
    static NSString *const urlString = @"http://cubesale.corp.yahoo.com/index.php?cmd=updateList";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"ListingsViewController: viewDidLoad here 1");
    
    // 2
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
     // 3
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        NSLog(@"didTapGetNameButtonnnnnn: Cubesale Call successful!");
                                                        NSDictionary *dict  = (NSDictionary *)JSON;
                                                        NSArray *items = (NSArray*)[dict valueForKey:@"items"];
                                                        
                                                        self.listItems = [[NSMutableArray alloc] initWithCapacity:100];
                                                        int i=0;
                                                        NSLog(@"ListingsViewController: count %d", items.count);
                                                        for (i = items.count-1; i >= (items.count - 100); i--) {
                                                            NSDictionary *anItem = [items objectAtIndex: i];
                                                            NSString *sdesc =  (NSString*)[anItem valueForKey:@"sdesc"];
                                                            NSString *ctime =  (NSString*)[anItem valueForKey:@"ctime"];
                                                            ListItem *listItem = [[ListItem alloc] init];
                                                            listItem.sdesc = sdesc;
                                                            listItem.ctime = ctime;
                                                            [[self listItems] addObject:listItem];
                                                            NSLog(@"ListingsViewController: sdesc %@", sdesc);
                                                            NSLog(@"ListingsViewController: ctime %@", ctime);
                                                        }

                                                        UINib *customNib = [UINib nibWithNibName:@"ListItemCell" bundle:nil];
                                                        [self.tableView registerNib:customNib forCellReuseIdentifier:@"ListItemCell"];
                                                        
                                                    }
     // 4
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        NSLog(@"ListingsViewController: viewDidLoad error");
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error logging in"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                        
                                                    }];
    
    // 5
    [operation start];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListItemCell";
    ListItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ListItem *listItem = self.listItems[indexPath.row];
    
    cell.sdescLabel.text = listItem.sdesc;
    cell.ctimeLabel.text = listItem.ctime;
    
    [cell.sdescLabel setLineBreakMode: NSLineBreakByWordWrapping];
    cell.sdescLabel.numberOfLines = 0;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
