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
#import "ListingCardViewController.h"


@interface ListingsViewController ()

@property (nonatomic, strong) NSMutableArray *listItems;

- (void) fetchUserName;
- (void) formatCell:(ListItemCell *) listItemCell backgroundColor:(UIColor *) backgroundColor textColor:(UIColor *) textColor;

@end

@implementation ListingsViewController

@synthesize savedUserId;
@synthesize savedUserName;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    NSLog(@"%@", @"ListingsViewController:initWithStyle called...");
    
    if (self) {
        NSLog(@"%@", @"ListingsViewController:initWithStyle about to call reload...");
        [self reload];
        
    }
    return self;
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
    UINib *customNib = [UINib nibWithNibName:@"ListItemCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"ListItemCell"];
    
    [self fetchUserName];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 1 target:self selector:@selector(fixTitleUser:) userInfo:nil repeats:NO];

    [self.navigationItem setHidesBackButton:YES];
    
}

-(void) fixTitleUser:(NSTimer *)timer
{
    NSLog(@"fixTitleUserEmail: %@", self.savedUserName);
    NSLog(@"fixTitleUserId: %@", self.savedUserId);
    NSLog(@"fixTitleUser class: %@", [[self class] debugDescription]);
    self.title = [NSString stringWithFormat:@"Hello %@", self.savedUserName];
}

- (void)reload
{
    static NSString *const urlString = @"http://cubesale.corp.yahoo.com/index.php?cmd=updateList";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"ListingsViewController: reload :: 1");
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                    JSONRequestOperationWithRequest:request
                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                            NSDictionary *dict  = (NSDictionary *)JSON;
                            NSArray *items = (NSArray*)[dict valueForKey:@"items"];
                            NSRange theRange;
                            
                            theRange.location = items.count - 100;
                            theRange.length = 100;
                            
                            items = [[[items subarrayWithRange:theRange] reverseObjectEnumerator] allObjects];
                            self.listItems = [ListItem listItemsWithArray:items];
                            [self.tableView reloadData];

                            /*
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
                             //NSLog(@"ListingsViewController: sdesc %@", sdesc);
                             //NSLog(@"ListingsViewController: ctime %@", ctime);
                             }
                             ListItem *tempItem = self.listItems[0];
                             
                             NSLog(@"ListingsViewController: 0th sdesc %@", tempItem.sdesc);
                             NSLog(@"ListingsViewController: 0th ctime %@", tempItem.ctime);
                             */
                            
                            
                            
                        }
                                         // 4
                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                            NSLog(@"ListingsViewController: reload error");
                            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error logging in"                                                                         message:[NSString stringWithFormat:@"%@",error]                                                                        delegate:nil
                                cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            [av show];
                            
                        }];

    [operation start];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) fetchUserName
{
    static NSString *const baseURLString = @"http://php.corp.yahoo.com/";
    NSString *userProfileJsonUrl = [NSString stringWithFormat:@"%@emp.php?query=%@&type=email", baseURLString, self.savedUserId];
    NSURL *url = [NSURL URLWithString:userProfileJsonUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSLog(@"getUserNameWithEmail: before Request");
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                NSLog(@"getUserNameWithEmail: Call successful!");
                NSDictionary *dict  = (NSDictionary *)JSON;
                NSArray *yahoos = (NSArray*)[dict valueForKey:@"yahoos"];
                NSDictionary *aYahoo = [yahoos objectAtIndex: 0];
                self.savedUserName = (NSString*)[aYahoo valueForKey:@"yfirst"];
                NSLog(@"Name: %@", self.savedUserName);
                NSLog(@"getUserNameWithEmail class: %@", [[self class] debugDescription]);
            }
            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                NSLog(@"getUserNameWithEmail: Call failed!");
                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                    message:[NSString stringWithFormat:@"%@",error]
                    delegate:nil
                    cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [av show];
                                                    }];
    
    [operation start];
    
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
    
    
    [cell.sdescLabel setLineBreakMode: NSLineBreakByWordWrapping];
    cell.sdescLabel.numberOfLines = 0;
    cell.sdescLabel.text = listItem.sdesc;
    cell.ctimeLabel.text = listItem.ctime;
    cell.ynickLabel.text = listItem.ynick;
    cell.fpriceLabel.text = listItem.fprice;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    ListItemCell *listItemCell = (ListItemCell*) cell;
    if (indexPath.row % 2 == 0) {
        [self formatCell:listItemCell backgroundColor:[UIColor blackColor] textColor:[UIColor whiteColor]];
    } else {
        [self formatCell:listItemCell backgroundColor: UIColorFromRGB(0x400090) textColor:[UIColor whiteColor]];
    }
}

- (void) formatCell:(ListItemCell *) listItemCell backgroundColor:(UIColor *) backgroundColor textColor:(UIColor *) textColor
{
    listItemCell.sdescLabel.textColor = textColor;
    listItemCell.ctimeLabel.textColor = textColor;
    listItemCell.fpriceLabel.textColor = textColor;
    listItemCell.ynickLabel.textColor = textColor;
    listItemCell.backgroundColor = backgroundColor;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListItem *listItem = self.listItems[indexPath.row];
    
    CGSize size = [listItem.sdesc sizeWithFont:[UIFont systemFontOfSize:17]
                             constrainedToSize:CGSizeMake(self.view.window.bounds.size.width - 40,     CGFLOAT_MAX)
                                 lineBreakMode:NSLineBreakByWordWrapping];
    
    
    return size.height+60;
}
 */



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ListingCardViewController *lcvc = [[ListingCardViewController alloc] init];
    ListItem *listItem = self.listItems[indexPath.row];    
    lcvc.listItem = listItem;
    [self.navigationController pushViewController:lcvc animated:YES];
}

    /*
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    BATTrailsViewController *trailsController = [[BATTrailsViewController alloc] initWithStyle:UITableViewStylePlain];
    trailsController.selectedRegion = [regions objectAtIndex:indexPath.row];
    [[self navigationController] pushViewController:trailsController animated:YES];
     */


@end
