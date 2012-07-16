//
//  MasterViewController.m
//  OrderFood
//
//  Created by German Giunta on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "FoodStore.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize stores = _stores;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    // Load stores array with stores.plist
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"stores" ofType:@"plist"];
    self.stores = [[NSMutableArray arrayWithContentsOfFile:plistPath] copy];
    self.title = @"Order Food";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _stores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [[self.stores objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.detailTextLabel.text = [[self.stores objectAtIndex:indexPath.row] valueForKey:@"category"];
    NSString *imageFileName = [[self.stores objectAtIndex:indexPath.row] valueForKey:@"logo"];
    cell.imageView.image = [UIImage imageNamed:imageFileName];
    if (!cell.imageView.image) {
        cell.imageView.image = [UIImage imageNamed:@"foodGenericHd"];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailController = segue.destinationViewController;
    
    NSDictionary *storeDic = [self.stores objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    NSString *category = [storeDic valueForKey:@"category"];
    NSString *name = [storeDic valueForKey:@"name"];
    NSString *area = [storeDic valueForKey:@"area"];
    NSString *phone = [storeDic valueForKey:@"phone"];
    NSString *prices = [storeDic valueForKey:@"prices"];
    NSString *url_menu = [storeDic valueForKey:@"url_menu"];
    NSString *logoFileName = [storeDic valueForKey:@"logo"];
    NSString *lat = [storeDic valueForKey:@"lat"];
    NSString *lon = [storeDic valueForKey:@"lon"];
    FoodStore *store = [[FoodStore alloc] initWithCategory:category name:name area:area phone:phone prices:prices url_menu:url_menu logoFileName:logoFileName lat:lat lon:lon];
    detailController.detailItem = store;
}

@end
